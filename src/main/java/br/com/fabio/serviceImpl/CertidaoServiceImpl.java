package br.com.fabio.serviceImpl;

import br.com.fabio.entity.Protocolo;
import br.com.fabio.repository.ProtocoloRepository;
import br.com.fabio.service.CertidaoService;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.glxn.qrgen.QRCode;
import net.glxn.qrgen.image.ImageType;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CertidaoServiceImpl implements CertidaoService {

    private final ProtocoloRepository protocoloRepository;

    @Autowired
    public CertidaoServiceImpl(ProtocoloRepository protocoloRepository) {
        this.protocoloRepository = protocoloRepository;
    }

    @Override
    public void gerarCertidao(String nrAutenticacao, HttpSession session,
            HttpServletResponse response) throws Exception {
        List<Protocolo> protocolos = new ArrayList<>();
        ByteArrayOutputStream stream = new ByteArrayOutputStream();
        Protocolo protocolo = protocoloRepository
                .findBycodigoAutenticacao(nrAutenticacao);
        JasperReport report;
        JasperPrint print;

        if (protocolo != null) {
            protocolos.add(protocolo);

            Map<String, Object> param = carregarParametros(
                    protocolo.getCodigoAutenticacao(), session);

            report = JasperCompileManager.compileReport(session.
                    getServletContext().getRealPath("/certidao.jrxml"));

            print = JasperFillManager.fillReport(report, param,
                    new JRBeanCollectionDataSource(protocolos));

            JasperExportManager.exportReportToPdfStream(print, stream);

            String fileName = "certidao" + nrAutenticacao + ".pdf";

            response.setContentLength(stream.size());
            response.setContentType("application/pdf");
            response.setHeader("Pragma", "");
            response.setHeader("Cache-Control", "");
            response.setHeader("Expires", "");
            response.setHeader("Content-Disposition",
                    "filename=\"" + fileName + "\"");

            try (OutputStream out = response.getOutputStream()) {
                stream.writeTo(out);
                out.flush();
            }
        }
    }

    @Override
    public boolean validarCodigoAutenticacao(String nrAutenticacao) {
        Protocolo protocolo = protocoloRepository
                .findBycodigoAutenticacao(nrAutenticacao);

        return (protocolo != null);
    }

    private Map<String, Object> carregarParametros(String nrAutenticacao,
            HttpSession session) throws Exception {
        InputStream image = null;
        InputStream imageQrCode = null;
        Map<String, Object> param = new HashMap<>();

        try {
            image = new FileInputStream(new File(session.getServletContext()
                    .getRealPath("/img/logo-bombeiro.png")));

            imageQrCode = new FileInputStream(QRCode
                    .from("http://192.168.0.102:8080/autenticar?nrAutenticacao=" + nrAutenticacao).to(ImageType.JPG).file());
        } catch (FileNotFoundException ex) {
            throw ex;
        }

        param.put("imagem", image);
        param.put("imagemQrCode", imageQrCode);

        return param;
    }
}

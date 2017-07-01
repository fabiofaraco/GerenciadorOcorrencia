package br.com.fabio.controller;

import br.com.fabio.entity.Protocolo;
import br.com.fabio.service.ProtocoloService;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("certidao")
public class CertidaoController {

    @Autowired
    private ProtocoloService service;
    
    @RequestMapping("/")
    public String getForm(Model model) {
        return "certidao";
    }

    @RequestMapping("/gerarCertidao")
    public void gerarCertidao(String nrAutenticacao, HttpSession session, HttpServletResponse response) {

        try 
        {
            ArrayList<Protocolo> list = new ArrayList<>();
            Protocolo protocolo = service.findById(1);
            
            
            list.add(protocolo);
            
            System.out.println("Gerando...");

            response.setContentType("application/pdf");

            InputStream image = new FileInputStream(new File(session
                    .getServletContext().getRealPath("/img/logo-bombeiro.png")));
            
            File qrCodeFile = QRCode.from(protocolo.getCodigoAutenticacao())
                    .to(ImageType.JPG).file();
            
            InputStream qrCodeImage = new FileInputStream(qrCodeFile);
            
            Map<String, Object> param = new HashMap<>();
            param.put("imagem", image);
            param.put("imagemQrCode", qrCodeImage);
            
            image.close();
            qrCodeImage.close();
            
            JasperReport report = JasperCompileManager.compileReport(session.
                    getServletContext().getRealPath("/certidao.jrxml"));
            
            JasperPrint print = JasperFillManager.fillReport(report, param, 
                    new JRBeanCollectionDataSource(list));

            ByteArrayOutputStream stream = new ByteArrayOutputStream();

            JasperExportManager.exportReportToPdfStream(print, stream);

            response.setHeader("Pragma", "");
            response.setHeader("Cache-Control", "");
            response.setHeader("Expires", "");

            OutputStream out = response.getOutputStream();
            stream.writeTo(out);
            response.setContentLength(stream.size());
            out.flush();
            out.close();

            System.out.println("Gerado...");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

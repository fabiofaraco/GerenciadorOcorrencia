package br.com.fabio.serviceImpl;

import br.com.fabio.entity.Ocorrencia;
import br.com.fabio.entity.Protocolo;
import br.com.fabio.entity.Requerente;
import br.com.fabio.repository.OcorrenciaRepository;
import br.com.fabio.repository.ProtocoloRepository;
import br.com.fabio.repository.RequerenteRepository;
import br.com.fabio.service.ProtocoloService;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProtocoloServiceImpl implements ProtocoloService {

    @Autowired
    private ProtocoloRepository protocoloRepository;
    @Autowired
    private RequerenteRepository requerenteRepository;
    @Autowired
    private OcorrenciaRepository ocorrenciaRepository;

    @Override
    public Protocolo salvar(int id, int idRequerente, int idOcorrencia) {

        if (protocoloRepository.findByRequerenteIdAndOcorrenciaId(
                idRequerente, idOcorrencia) == null) {

            String codigoAutenticacao = gerarCodigoAutenticacao(idRequerente, idOcorrencia);
            Protocolo protocolo = new Protocolo(id, idRequerente, idOcorrencia, codigoAutenticacao);

            return protocoloRepository.save(protocolo);
        }

        return null;
    }

    @Override
    public List<Protocolo> filtrar(String cpfRequerente, String condigoAutenticacao) {

        return protocoloRepository.findByRequerenteCpfAndCodigoAutenticacao(
                cpfRequerente, condigoAutenticacao);
    }

    @Override
    public void deletar(Protocolo protocolo) {
        protocoloRepository.delete(protocolo);
    }

    private String gerarCodigoAutenticacao(int idRequerente, int idOcorrencia) {

        Requerente requerente = requerenteRepository.findById(idRequerente);
        Ocorrencia ocorrencia = ocorrenciaRepository.findById(idOcorrencia);

        String codigo = converteDataHoje()
                + converteData(requerente.getDataNascimento())
                + converteData(ocorrencia.getDataOcorrencia())
                + requerente.getId()
                + ocorrencia.getId();

        return codigo;
    }

    private String converteData(Date data) {
        try {
            
            SimpleDateFormat frmt = new SimpleDateFormat("yyyyMMdd");

            return frmt.format(data);
        } catch (Exception ex) {
            return "99999999";
        }
    }

    private String converteDataHoje() {
        SimpleDateFormat frmt = new SimpleDateFormat("yyyyMMdd");

        return frmt.format(new Date());
    }

    @Override
    public Protocolo findById(int id) {
        return protocoloRepository.findById(id);
    }
}

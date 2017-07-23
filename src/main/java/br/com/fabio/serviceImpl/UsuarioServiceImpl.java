package br.com.fabio.serviceImpl;

import br.com.fabio.entity.Usuario;
import br.com.fabio.repository.UsuarioRepository;
import br.com.fabio.service.UsuarioService;
import java.util.List;
import java.util.Properties;
import java.util.UUID;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UsuarioServiceImpl implements UsuarioService {

    @Autowired
    private UsuarioRepository usuarioRepository;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public Usuario findById(int id) {
        return usuarioRepository.findById(id);
    }

    @Override
    public Usuario findByEmail(String email) {
        return usuarioRepository.findByEmail(email);
    }

    @Override
    public Usuario buscarPorCpf(String cpf, int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Usuario> findByNomeOrCpf(String nomeFiltro, String cpfFiltro) {
        return usuarioRepository.findByNomeOrCpf(nomeFiltro, cpfFiltro);
    }

    @Override
    public void deletar(Usuario usuario) {
        usuarioRepository.delete(usuario);
    }

    @Override
    public void salvar(Usuario usuario) {
        usuarioRepository.save(usuario);
    }

    @Override
    public int emailRedefinirSenha(String email) {
        Usuario usuario = findByEmail(email);

        if (usuario == null) {
            return 1;
        }

        String novaSenha = gerarSenha(8);
        usuario.setSenha(bCryptPasswordEncoder.encode(novaSenha));
        salvar(usuario);

        if(!enviarEmail(email, novaSenha)) {
            return 2;
        }
        
        return 0;
    }

    private String gerarSenha(int tamanho) {
        return UUID.randomUUID().toString().substring(0, tamanho);
    }

    private boolean enviarEmail(String email, String novaSenha) {
        Properties props = new Properties();

        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");

        Session session = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {

            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("gerenciadorocorrenciaadm@gmail.com", "gerenciador");
            }
        });

        session.setDebug(true);

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("gerenciadorocorrenciaadm@gmail.com"));

            Address[] toUser = InternetAddress
                    .parse(email);

            message.setRecipients(Message.RecipientType.TO, toUser);
            message.setSubject("Teste de e-mail");
            message.setText("Sua nova senha é: " + novaSenha);

            Transport.send(message);

        } catch (MessagingException e) {
            return false;
        }
        
        return true;
    }

}

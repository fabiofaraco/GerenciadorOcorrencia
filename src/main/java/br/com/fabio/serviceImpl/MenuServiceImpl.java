package br.com.fabio.serviceImpl;

import br.com.fabio.entity.Menu;
import br.com.fabio.entity.Usuario;
import br.com.fabio.repository.UsuarioRepository;
import br.com.fabio.service.MenuService;
import br.com.fabio.util.Constantes;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

@Service
public class MenuServiceImpl implements MenuService {

    @Autowired
    private UsuarioRepository usuarioRepository;

    @Override
    @SuppressWarnings("null")
    public List<Menu> montarMenu() {

        Object usuarioLogado = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Usuario usuario = null;
        String email;

        if (usuarioLogado instanceof UserDetails) {
            email = ((UserDetails) usuarioLogado).getUsername();
            usuario = usuarioRepository.findByEmail(email);

        }

        List<Menu> menu = new ArrayList<>();

        if (usuario.getPerfil().getId() == Constantes.ID_PERFIL_ADMINISTRADOR) {
            menu.add(new Menu("liUsuario", "aUsuario", "Usuários", "fa fa-fw fa-user", true));
            menu.add(new Menu("liRequerente", "aRequerente", "Requerentes", "fa fa-fw fa-users"));
            menu.add(new Menu("liOcorrencia", "aOcorrencia", "Ocorrências", "fa fa-fw fa-ambulance"));
            menu.add(new Menu("liProtocolo", "aProtocolo", "Protocolos", "fa fa-fw fa-folder"));
            menu.add(new Menu("liCertidao", "aCertidao", "Certidão", "fa fa-fw fa-file-pdf-o"));
            menu.add(new Menu("liGrafico", "aGrafico", "Gráficos", "fa fa-fw fa-pie-chart"));
        } else if (usuario.getPerfil().getId() == Constantes.ID_PERFIL_ELABORADOR) {
            menu.add(new Menu("liRequerente", "aRequerente", "Requerentes", "fa fa-fw fa-users", true));
            menu.add(new Menu("liOcorrencia", "aOcorrencia", "Ocorrências", "fa fa-fw fa-ambulance"));
            menu.add(new Menu("liProtocolo", "aProtocolo", "Protocolos", "fa fa-fw fa-folder"));
            menu.add(new Menu("liCertidao", "aCertidao", "Certidão", "fa fa-fw fa-file-pdf-o"));
        } else if (usuario.getPerfil().getId() == Constantes.ID_PERFIL_MEMBRO_EQUIPE) {
            menu.add(new Menu("liOcorrencia", "aOcorrencia", "Ocorrências", "fa fa-fw fa-ambulance", true));
        }

        return menu;
    }

}

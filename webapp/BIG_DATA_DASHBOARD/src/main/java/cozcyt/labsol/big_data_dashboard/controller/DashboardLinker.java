/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cozcyt.labsol.big_data_dashboard.controller;

import cozcyt.labsol.big_data_dashboard.model.session.URLResources;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author oima
 */
@Controller
public class DashboardLinker {

    @RequestMapping(method = RequestMethod.GET, value = "/BigDataServer.labsol")
    public String goToDashBoard(Model model, String serverIp, String serverPort) {
        URLResources urlr = new URLResources();
        model.addAttribute("monitorRecursos", urlr.monitorRecursos);
        model.addAttribute("cargaRecursos", urlr.cargaRecursos);
        model.addAttribute("monitorServicios", urlr.monitorServicios);
        model.addAttribute("monitorTareas", urlr.monitorTareas);
        model.addAttribute("monitorHosts", urlr.monitorHosts);
        model.addAttribute("administradoresCluster", urlr.administradoresCluster);
        
        model.addAttribute("adminAmbari", urlr.adminAmbari);
        model.addAttribute("adminHue", urlr.adminHue);
        
//        model.addAttribute("configuracionServicios", urlr.conf);
//        model.addAttribute("configuracionPendiente", urlr.conf);
        
        model.addAttribute("logsServidor", urlr.monitorRecursos);
        
        model.addAttribute("crearTabla", urlr.crearTabla);
        model.addAttribute("crearBaseDatos", urlr.crearBaseDatos);
        model.addAttribute("crearConsulta", urlr.crearConsulta);
        model.addAttribute("misConsultas", urlr.misConsultas);
        model.addAttribute("listaConsultas", urlr.listaConsultas);
        model.addAttribute("historiaConsultas", urlr.historialConsultas);
        
        model.addAttribute("monitorRutinas", urlr.monitorRutinas);
        model.addAttribute("verRutinas", urlr.verRutinas);
        model.addAttribute("crearRutina", urlr.crearRutina);
        model.addAttribute("importarRutina", urlr.importarRutina);
        model.addAttribute("verCoordinadores", urlr.verCoordinadores);
        model.addAttribute("crearCoordinador", urlr.crearCoordinador);
        model.addAttribute("enlazadorRutinas", urlr.enlazadorRutinas);
        
        model.addAttribute("shellPig", urlr.shellPig);
        model.addAttribute("shellHBase", urlr.shellHBase);
        model.addAttribute("shellBash", urlr.shellBash);
        
        model.addAttribute("administradorArchivos", urlr.administradorArchivos);
        
        model.addAttribute("monitorTrabajos", urlr.monitorTrabajos);
        model.addAttribute("crearTrabajo", urlr.crearTrabajo);
        
        
        model.addAttribute("adminAmbari", urlr.adminAmbari);
        model.addAttribute("adminHue", urlr.adminHue);
        return "/DashBoard";
    }

    
}

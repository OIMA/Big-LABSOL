/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cozcyt.labsol.big_data_dashboard.model.session;

/**
 *
 * @author oima
 */
public class URLResources extends ServerConfiguration {

    private final String direccionAmbari = ipAmbari + ":" + puertoAmbari + "/";
    private final String direccionHue = ipHue + ":" + puertoHue + "/";
    private final String direccionServidor = ipServer + ":" + puertoServer + "/";

    public String monitorRecursos = direccionAmbari + "";
    public String cargaRecursos = direccionAmbari + "";
    public String monitorServicios = direccionAmbari + "";
    public String monitorTareas = direccionAmbari + "";
    public String monitorHosts = direccionAmbari + "";
    public String administradoresCluster = direccionAmbari + "";

    public String adminAmbari = direccionAmbari + "";
    public String adminHue = direccionHue + "useradmin";

    public String crearTabla = direccionHue + "hcatalog/tables";
    public String crearBaseDatos = direccionHue + "hcatalog/databases";
    public String crearConsulta = direccionHue + "beeswax/execute";
    public String misConsultas = direccionHue + "beeswax/my_queries";
    public String listaConsultas = direccionHue + "beeswax/list_designs";
    public String historialConsultas = direccionHue + "beeswax/query_history";

    public String monitorRutinas = direccionHue + "oozie/";
    public String verRutinas = direccionHue + "oozie/list_workflows";
    public String crearRutina = direccionHue + "oozie/create_workflow";
    public String importarRutina = direccionHue + "oozie/import_workflow";
    public String verCoordinadores = direccionHue + "oozie/list_coordinators";
    public String crearCoordinador = direccionHue + "oozie/create/coordinator";
    public String enlazadorRutinas = direccionHue + "oozie/list_bundles";

    public String shellPig = direccionHue + "shell/create?keyName=pig";
    public String shellHBase = direccionHue + "shell/create?keyName=hbase";
    public String shellBash = direccionHue + "shell/create?keyName=bash";

    public String administradorArchivos = direccionHue + "filebrowser";
    
    public String monitorTrabajos = direccionHue + "jobbrowser";
    public String crearTrabajo = direccionHue + "jobsub";

    
    public String perfilHue = direccionHue + "useradmin/users/edit";
    public String cerrarSesionHue = direccionHue + "accounts/logout";
}

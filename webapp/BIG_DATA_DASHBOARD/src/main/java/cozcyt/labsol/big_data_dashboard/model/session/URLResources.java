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

    public String monitorRecursos = direccionAmbari + "#/main/dashboard";
    public String cargaRecursos = direccionAmbari + "#/main/charts";
    public String monitorServicios = direccionAmbari + "#/main/services";
    public String monitorTareas = direccionAmbari + "#/main/jobs";
    public String monitorHosts = direccionAmbari + "#/main/hosts";
    public String administradoresCluster = direccionAmbari + "#/main/admin";

    public String adminAmbari = direccionAmbari + "#/main/admin";
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

    public String administradorArchivos = direccionHue + "filebrowser/";
    
    public String monitorTrabajos = direccionHue + "jobbrowser";
    public String crearTrabajo = direccionHue + "jobsub";

    public String pigScripts = direccionHue + "pig";
    public String configuracionServicios = direccionHue + "dump_config";
    public String configuracionPendiente = direccionHue + "debug/check_config";
    public String logs = direccionHue + "logs";
//    public String configuracionPendiente = direccionHue + "debug/check_config";
    
    public String perfilHue = direccionHue + "useradmin/users/edit";
    public String cerrarSesionHue = direccionHue + "accounts/logout";
}

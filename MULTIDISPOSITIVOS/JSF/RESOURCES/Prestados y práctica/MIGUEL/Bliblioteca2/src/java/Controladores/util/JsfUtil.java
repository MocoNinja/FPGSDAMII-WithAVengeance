package Controladores.util;

import java.util.List;
import Entidades.Paises;
import Entidades.Autores;
import Entidades.Premios;
import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.model.SelectItem;

public class JsfUtil {

    public static SelectItem[] getSelectItems(List<?> entities, boolean selectOne) {
        int size = selectOne ? entities.size() + 1 : entities.size();
        SelectItem[] items = new SelectItem[size];
        int i = 0;
        if (selectOne) {
            items[0] = new SelectItem("", "---");
            i++;
        }
        for (Object x : entities) {
            items[i++] = new SelectItem(x, x.toString());
        }
        return items;
    }
    
     public static SelectItem[] getSelectItemsPaises(List<Paises> entities, boolean selectOne) {
        int size = selectOne ? entities.size() + 1 : entities.size();
        SelectItem[] items = new SelectItem[size];
        int i = 0;
        if (selectOne) {
            items[0] = new SelectItem("", "Seleciona un Pais");
            i++;
        }
        for (Paises x : entities) {
            items[i++] = new SelectItem(x, x.getNomPais());//esto es el desplegable, selected (id(value),text)
        }
        return items;
    }

      public static SelectItem[] getSelectItemsAutores(List<Autores> entities, boolean selectOne) {
        int size = selectOne ? entities.size(): entities.size();
        SelectItem[] items = new SelectItem[size];
        int i = 0;
     
        for (Autores x : entities) {
            items[i++] = new SelectItem(x, x.getApellido1()+ " " +x.getApellido2() +", " +x.getNomAutor());
        }
        return items;
    }
      
    public static SelectItem[] getSelectItemsPremios(List<Premios> entities, boolean selectOne) {
        int size = selectOne ? entities.size(): entities.size();
        SelectItem[] items = new SelectItem[size];
        int i = 0;
       
        for (Premios x : entities) {
            items[i++] = new SelectItem(x, x.getNomPremio());
        }
        return items;
    }
     
    public static void addErrorMessage(Exception ex, String defaultMsg) {
        String msg = ex.getLocalizedMessage();
        if (msg != null && msg.length() > 0) {
            addErrorMessage(msg);
        } else {
            addErrorMessage(defaultMsg);
        }
    }

    public static void addErrorMessages(List<String> messages) {
        for (String message : messages) {
            addErrorMessage(message);
        }
    }

    public static void addErrorMessage(String msg) {
        FacesMessage facesMsg = new FacesMessage(FacesMessage.SEVERITY_ERROR, msg, msg);
        FacesContext.getCurrentInstance().addMessage(null, facesMsg);
    }

    public static void addSuccessMessage(String msg) {
        FacesMessage facesMsg = new FacesMessage(FacesMessage.SEVERITY_INFO, msg, msg);
        FacesContext.getCurrentInstance().addMessage("successInfo", facesMsg);
    }

    public static String getRequestParameter(String key) {
        return FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap().get(key);
    }

    public static Object getObjectFromRequestParameter(String requestParameterName, Converter converter, UIComponent component) {
        String theId = JsfUtil.getRequestParameter(requestParameterName);
        return converter.getAsObject(FacesContext.getCurrentInstance(), component, theId);
    }

}

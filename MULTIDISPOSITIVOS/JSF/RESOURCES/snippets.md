# Snippets de JSF

**NO OLVIDAR** el import:```html xmlns:p="http://primefaces.org/ui"```

## TieredMenu para JSF

```html
<h:form>
    <p:growl id="messages" showDetail="true" />
    <p:tieredMenu style="width:200px">
        <p:submenu label="Autores" icon="ui-icon-person">
            <p:menuitem value="Listado" outcome="/autores/List" icon="ui-icon-disk" />
        </p:submenu>
    <p:separator />
    <p:submenu label="Países" icon="ui-icon-flag">
        <p:menuitem value="Listado" outcome="/paises/List" icon="ui-icon-flag" />
    </p:submenu>
    </p:tieredMenu>
    <p:separator />
</h:form>
```

## DataTable con paginación para JSF

```html
<h:form>
    <p:dataTable var="car" value="#{dtPaginatorView.cars}" rows="10" paginator="true" paginatorTemplate="{CurrentPageReport} {FirstPageLink} {PreviousPageLink} {PageLinks} {NextPageLink} {LastPageLink} {RowsPerPageDropdown}"
 rowsPerPageTemplate="5,10,15">
        <p:column headerText="Id">
            <h:outputText value="#{car.id}" />
        </p:column>
    </p:dataTable>
```

## Formato de fecha en JSF

```html
<h:outputText value="#{item.FDef}" >
    <f:convertDateTime pattern="dd/MM/yyyy"/>
</h:outputText>
```

## Imagen en JSF

```html
<p:column headerText="Foto" style="text-align: center">
    <p:lightBox styleClass="imagebox" id="lighbox1"> 
        <h:outputLink value="/Biblioteca/faces/javax.faces.resources/#{item.foto}?ln=Escritores" title="{item.nomAutor} #{item.apellido1} #{item.apellido2}" >
            <h:graphicImage library="Escritores" name="#{item.foto}" height="45"/>
        </h:outputLink>
    </p:lightBox>
</p:column>
```
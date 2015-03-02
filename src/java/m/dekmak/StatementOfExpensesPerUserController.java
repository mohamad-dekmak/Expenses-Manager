package m.dekmak;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.export.oasis.JROdtExporter;
import net.sf.jasperreports.engine.export.ooxml.JRDocxExporter;
import net.sf.jasperreports.engine.export.ooxml.JRDocxExporterParameter;
import net.sf.jasperreports.engine.export.ooxml.JRPptxExporter;
import net.sf.jasperreports.engine.export.ooxml.JRXlsxExporter;

@ManagedBean
@SessionScoped
public class StatementOfExpensesPerUserController {
    private List<StatementOfExpensesPerUser> listOfStatementOfExpensesPerUser;

    @EJB StatementOfExpensesPerUserFacade StatementOfExpensesPerUserFacade;

    public List<StatementOfExpensesPerUser> getListOfStatementOfExpensesPerUser() {
        listOfStatementOfExpensesPerUser = StatementOfExpensesPerUserFacade.findAll();
        return listOfStatementOfExpensesPerUser;
    }

    public void setListOfStatementOfExpensesPerUser(List<StatementOfExpensesPerUser> listOfStatementOfExpensesPerUser) {
        this.listOfStatementOfExpensesPerUser = listOfStatementOfExpensesPerUser;
    }
    JasperPrint jasperPrint;

    public void init() throws JRException {
        JRBeanCollectionDataSource beanCollectionDataSource = new JRBeanCollectionDataSource(listOfStatementOfExpensesPerUser);
        String reportPath = FacesContext.getCurrentInstance().getExternalContext().getRealPath("/reports/statement_of_expenses_per_user/report.jasper");
        jasperPrint = JasperFillManager.fillReport(reportPath, new HashMap(), beanCollectionDataSource);
    }

    public void PDF(ActionEvent actionEvent) throws JRException, IOException {
        init();
        HttpServletResponse httpServletResponse = (HttpServletResponse) FacesContext.getCurrentInstance().getExternalContext().getResponse();
        httpServletResponse.addHeader("Content-disposition", "attachment; filename=statement_of_expenses_per_user.pdf");
        ServletOutputStream servletOutputStream = httpServletResponse.getOutputStream();
        JasperExportManager.exportReportToPdfStream(jasperPrint, servletOutputStream);
        FacesContext.getCurrentInstance().responseComplete();

    }

    public void DOCX(ActionEvent actionEvent) throws JRException, IOException {
        init();
        HttpServletResponse httpServletResponse = (HttpServletResponse) FacesContext.getCurrentInstance().getExternalContext().getResponse();
        httpServletResponse.addHeader("Content-disposition", "attachment; filename=statement_of_expenses_per_user.docx");
        ServletOutputStream servletOutputStream = httpServletResponse.getOutputStream();
        JRDocxExporter docxExporter = new JRDocxExporter();
        docxExporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
        docxExporter.setParameter(JRExporterParameter.OUTPUT_STREAM, servletOutputStream);
        docxExporter.setParameter(JRDocxExporterParameter.OUTPUT_STREAM, servletOutputStream);
        docxExporter.exportReport();
    }

    public void XLSX(ActionEvent actionEvent) throws JRException, IOException {
        init();
        HttpServletResponse httpServletResponse = (HttpServletResponse) FacesContext.getCurrentInstance().getExternalContext().getResponse();
        httpServletResponse.addHeader("Content-disposition", "attachment; filename=statement_of_expenses_per_user.xlsx");
        ServletOutputStream servletOutputStream = httpServletResponse.getOutputStream();
        JRXlsxExporter docxExporter = new JRXlsxExporter();
        docxExporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
        docxExporter.setParameter(JRExporterParameter.OUTPUT_STREAM, servletOutputStream);
        docxExporter.exportReport();
    }

    public void ODT(ActionEvent actionEvent) throws JRException, IOException {
        init();
        HttpServletResponse httpServletResponse = (HttpServletResponse) FacesContext.getCurrentInstance().getExternalContext().getResponse();
        httpServletResponse.addHeader("Content-disposition", "attachment; filename=statement_of_expenses_per_user.odt");
        ServletOutputStream servletOutputStream = httpServletResponse.getOutputStream();
        JROdtExporter docxExporter = new JROdtExporter();
        docxExporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
        docxExporter.setParameter(JRExporterParameter.OUTPUT_STREAM, servletOutputStream);
        docxExporter.exportReport();
    }

    public void PPT(ActionEvent actionEvent) throws JRException, IOException {
        init();
        HttpServletResponse httpServletResponse = (HttpServletResponse) FacesContext.getCurrentInstance().getExternalContext().getResponse();
        httpServletResponse.addHeader("Content-disposition", "attachment; filename=statement_of_expenses_per_user.pptx");
        ServletOutputStream servletOutputStream = httpServletResponse.getOutputStream();
        JRPptxExporter docxExporter = new JRPptxExporter();
        docxExporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
        docxExporter.setParameter(JRExporterParameter.OUTPUT_STREAM, servletOutputStream);
        docxExporter.exportReport();
    }
}

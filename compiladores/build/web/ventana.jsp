import javax.inject.Named;
import javax.enterprise.context.RequestScoped;
import java.io.Serializable;

@Named
@RequestScoped
public class Ventana implements Serializable {
    private String datos;
    private String resultado;

    public Ventana() {
    }

    public String getDatos() {
        return datos;
    }

    public void setDatos(String datos) {
        this.datos = datos;
    }

    public String getResultado() {
        return resultado;
    }

    public void setResultado(String resultado) {
        this.resultado = resultado;
    }

    public void compilar() {
        Analizador_Lexico lexico = new Analizador_Lexico(new BufferedReader(new StringReader(datos)));
        analisis_sintactico sintactico = new analisis_sintactico(lexico);

        try {
            sintactico.parse();
            resultado = sintactico.resultado;
        } catch (Exception e) {
            // Manejo de excepciones
        }
    }
}

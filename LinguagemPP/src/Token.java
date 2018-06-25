import java.util.Formatter;
        
public class Token {
    public enum T {
        VAR             { public String toString() { return "VAR"; } },
        COMENTARIO      { public String toString() { return "COMENTARIO"; } },
        NUMERO          { public String toString() { return "NUMERO"; } },
        SE              { public String toString() { return "SE"; } },
        OU              { public String toString() { return "OU"; } },
        SENAO           { public String toString() { return "SENAO"; } },
        TIPO            { public String toString() { return "TIPO"; } },
        BOOLEANO        { public String toString() { return "BOOLEANO"; } },
        ENQUANTO        { public String toString() { return "ENQUANTO"; } },
        AP              { public String toString() { return "AP"; } },
        FP              { public String toString() { return "FP"; } },
        ACH             { public String toString() { return "ACH"; } },
        FCH             { public String toString() { return "FCH"; } },
        ACO             { public String toString() { return "ACO"; } },
        FCO             { public String toString() { return "FCO"; } },
        QUEBRA_LINHA    { public String toString() { return "QUEBRA_LINHA"; } },
        OP_MAT          { public String toString() { return "OP_MAT"; } },
        ATRIBUICAO      { public String toString() { return "ATRIBUICAO"; } },
        RESTO           { public String toString() { return "RESTO"; } },
        OP_REL          { public String toString() { return "OP_REL"; } },
        OP_LOG          { public String toString() { return "OP_LOG"; } },
        LEIA            { public String toString() { return "LEIA"; } },
        MOSTRE          { public String toString() { return "MOSTRE"; } },
        CARACTERE       { public String toString() { return "CARACTERE"; } },
        TEXTO           { public String toString() { return "TEXTO"; } },
        ERRO            { public String toString() { return "ERRO LÉXICO"; } }
    }
    
    public T type;
    public Object val;
    public int lin;
    public int col;
    
    public Token(T type, int lin, int col){
        this.type = type;
        this.lin = lin;
        this.col = col;                
    }
    
    public Token(T type, Object val, int lin, int col){
        this.type = type;
        this.val = val;
        this.lin = lin;
        this.col = col;                
    }
    
    @Override
    public String toString(){
        Formatter out = new Formatter();
        out.format("(%d, %d) %s", lin, col, type);
        if(val != null){
            out.format(" [%s]", val);
        }
        return out.toString();
    }
}

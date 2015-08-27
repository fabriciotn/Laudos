function formatar(src, mask){
    var i = src.value.length;
    var saida = mask.substring(0,1);
    var texto = mask.substring(i)
    if (texto.substring(0,1) != saida)
    {
        src.value += texto.substring(0,1);
    //return true;
    }
}

function imprime() {
    window.print();
}

function valida(){
    if(document.form.unidade.value=="" || document.form.setor.value==""
        || document.form.tipo.value=="" || document.form.marca.value==""
        || document.form.patrimonio.value=="" || document.form.serie.value==""
        || document.form.preliminar.value=="" || document.form.conclusivo.value==""
        || document.form.responsavel.value=="" || document.form.masp.value==""
        || document.form.fornecedor.value=="" || document.form.num_laud_forne.value==""
        || document.form.data_forne.value==""){
        window.alert("Campos obrigatorios!");
        document.form.unidade.focus();
        return false;
    }else if(document.form.data_forne.value.length < 10){
        window.alert("Digite a data no formato dd/mm/aaaa");
        document.form.data_forne.focus();
        return false;
    }
    return true;
}

function upperUni() {
    var field = document.form.unidade
    var upperCaseVersion = field.value.toUpperCase()
    field.value = upperCaseVersion
}

function upperTipo() {
    var field = document.form.tipo
    var upperCaseVersion = field.value.toUpperCase()
    field.value = upperCaseVersion
}

function link(url) {
    window.location.href = url;
}

//function habilita(){
//    document.getElementById("a").disabled = false; //Habilitando
//}
//function desabilita(){
//    document.getElementById("a").disabled = true; //Desabilitando
//}

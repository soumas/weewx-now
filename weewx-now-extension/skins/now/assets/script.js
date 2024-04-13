function includeHTML() {
    var lst = document.getElementsByClassName("include-html");
    if (lst.length > 0) {
        var placeholder = lst[0];
        var path = placeholder.getAttribute("path");
        if (path) {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4) {
                    if (this.status == 200) {
                        const template = document.createElement('template');
                        template.innerHTML = this.responseText;
                        placeholder.replaceWith(template.content.children[0]);                        
                    }
                    if (this.status == 404) { 
                        placeholder.innerHTML = path + " Not found"; 
                        placeholder.classList.remove("include-html");
                    }
                    includeHTML();
                }
            }
            xhttp.open("GET", path, true);
            xhttp.send();
        }
    } else {
        afterIncludeHTML();
    }
}

async function loadJsonObj(fspath) {
    return (await fetch(fspath)).json();
}
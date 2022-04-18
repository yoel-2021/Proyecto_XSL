//1. Cuando la pagina este completamente se ejecuta el codigo JavaScript.
async function asyncCall() {
	// 2. Se recupera un documento XML de la URL especificada.
		const response = await fetch("https://www.zaragoza.es/sede/servicio/especie.xml");
		const data = await response.text();
		const parser = new DOMParser();
		const xml =  parser.parseFromString(data, "application/xml");
	//3. Se recupera un XSL con el nombre de archivo especificado.
		const responseXSL = await fetch("ejercicio.xsl"+ '?v=' + Date.now());
		const dataXSL = await responseXSL.text();
		const xsl = parser.parseFromString(dataXSL, "application/xml");
	//4. Se realiza la transformación utilizando xsltProcessor
		xsltProcessor = new XSLTProcessor();
		xsltProcessor.importStylesheet(xsl);
		resultDocument = xsltProcessor.transformToFragment(xml, document);
	//5. El resultado obtenido se incrusta dentro del elemento <body> del archivo HTML
		document.getElementsByTagName("body")[0].appendChild(resultDocument);
}

asyncCall();
<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes" />
    <xsl:template match="/">

        <xsl:apply-templates select="result/especie-en-parque" />
        <table border="1px">
            <xsl:for-each select="//especie-en-parque">
                <tr>
                    <td>
                        <br />
                        <p class="titulo">
                            <xsl:value-of select="common"></xsl:value-of>
                        </p>
                        <br />
                        <img>
                            <xsl:attribute name="src">
                                <xsl:for-each select="photo">
                                    <xsl:value-of select="." />
                                </xsl:for-each>
                            </xsl:attribute>
                        </img>
                        <xsl:if test="numberOfPhotos&gt;10">
                            <p>
                                <em>
                                    Más fotografías
                                    <a href="https://www.arbolesibericos.es/genres" target="blank">Aquí</a>
                                </em>
                            </p>
                        </xsl:if>
                        <br />
                        <br />
                        <p class="varios">
                            <em>
                                <strong>Nombre común : </strong>
                                <xsl:value-of select="commonName"></xsl:value-of>
                                <br />
                                <strong> Nombre ciéntifico : </strong>
                                <xsl:value-of select="scientificName"></xsl:value-of>
                                <br />
                                <strong>Familia : </strong>
                                <xsl:value-of select="family"></xsl:value-of>
                                <br />
                                <strong>Tipo : </strong>
                                <xsl:value-of select="type"></xsl:value-of>
                                <br />
                            </em>
                        </p>
                        
                        <p class="description">
                            <xsl:value-of select="shortDescription"></xsl:value-of>
                            <br />
                            <br />
                            <xsl:apply-templates select="description"/>
                        </p>
                        <br />
                        <br />
                    </td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>

  
    <xsl:template match="description">
  <span style="color:#808080 font-weight:bold">
  <xsl:value-of select="."/></span>
  <br />
</xsl:template>

</xsl:stylesheet>
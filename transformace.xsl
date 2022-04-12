<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <body>
  <h1>Vojenská vybavení</h1>

  <h2>Pušky seřazené podle počtu nábojů v zásobníku:</h2>
  <table border="1">
    <tr bgcolor="#05E2FF">
      <th>Název zbraně</th>
      <th>Rok výroby</th>
      <th>Velikost zásobníku</th>
      <th>Cena (Kč)</th>
      <th>Vynálezce</th>
    </tr>
<xsl:for-each select="vojeske_vybaveni/pusky">
    <xsl:sort select ="zasobnik"/>
    <tr>
      <td><xsl:value-of select="oznaceni_pusky"/></td>
      <td><xsl:value-of select="vyvinuto"/></td>
      <td><xsl:value-of select="zasobnik"/></td>
      <td><xsl:value-of select="cena"/></td>
      <td><xsl:value-of select="vynalezce"/></td>
    </tr>
</xsl:for-each>
  </table>
<p>Pušky v tabulce: <xsl:value-of select="count(/vojeske_vybaveni/pusky)"/></p>

<h2>Tanky s ráží 88mm a méně</h2>
<p>Vypíše nože:</p>
<table border="1">
    <tr bgcolor="#000000" style="color:white;">
      <th >Název</th>
      <th>materiál nože</th>
      <th>Délka čepele (cm)</th>
    </tr>
<xsl:for-each select="vojeske_vybaveni/noze">   
    <tr>
      <td><xsl:value-of select="nazev"/></td>
      <td><xsl:value-of select="material"/></td>
      <td><xsl:value-of select="delka_cepele"/></td>
    </tr>
</xsl:for-each>
</table>

<h2>Tanky s ráží 88mm a méně</h2>
<p>Metody Choose:</p>
<table border="1">
    <tr>
        <th>Označení</th>
        <th>dělo</th>
    </tr>
    <xsl:for-each select="vojeske_vybaveni/tank">
        <tr>
            <td><xsl:value-of select= "oznaceni_tanku"/></td>
            <xsl:choose>
                <xsl:when test="delo &gt; 88">
                    <td>
                        <xsl:value-of select="delo"/></td>
                </xsl:when>
                <xsl:otherwise>
                    <td bgcolor="#EBBD02">
                        <xsl:value-of select="delo"/></td>
                </xsl:otherwise>
            </xsl:choose>
        </tr>
    </xsl:for-each>
</table>


  </body>
  </html>
</xsl:template>
</xsl:stylesheet>

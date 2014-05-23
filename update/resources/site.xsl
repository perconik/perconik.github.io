<xsl:stylesheet version = '1.0' xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl='http://www.w3.org/1999/XSL/Transform' xmlns:msxsl="urn:schemas-microsoft-com:xslt">
  <xsl:output method="html" encoding="UTF-8" />
  <xsl:key name="cat" match="category" use="@name" />
  <xsl:template match="/">
    <xsl:for-each select="site">

      <div class="page-header">
        <h1>sk.stuba.fiit.perconik.update</h1>
      </div>

      <p>
        <xsl:value-of select="description" />
      </p>

      <br/>
      
      <table class="table table-bordered table-striped">
        <xsl:for-each select="category-def">
          <xsl:sort select="@name" order="ascending" case-order="upper-first" />
          <xsl:if test="count(key('cat',@name)) != 0">
            <thead>
              <tr>
                <th>
                  <xsl:value-of select="@name" />
                </th>
<!--
                <th>
                  <xsl:value-of select="@label" />
                </th>
-->
              </tr>
            </thead>
            <tbody>
              <xsl:for-each select="key('cat',@name)">
              <xsl:sort select="ancestor::feature//@version" order="ascending" />
              <xsl:sort select="ancestor::feature//@id" order="ascending" case-order="upper-first" />
              <tr>
                <td>
                    <xsl:choose>
                    <xsl:when test="ancestor::feature//@label">
                      <a href="{ancestor::feature//@url}"><xsl:value-of select="ancestor::feature//@label" /></a>
                      <p>
                      (<xsl:value-of select="ancestor::feature//@id" /> - <xsl:value-of select="ancestor::feature//@version" />)
                      </p>
                    </xsl:when>
                    <xsl:otherwise>
                      <a href="{ancestor::feature//@url}"><xsl:value-of select="ancestor::feature//@id" /> - <xsl:value-of select="ancestor::feature//@version" /></a>
                    </xsl:otherwise>
                    </xsl:choose>
                    <br />
                </td>
  <!--              
                <td>
                  <table>
                    <xsl:if test="ancestor::feature//@os">
                      <tr>
                      <td>Operating Systems:</td>
                      <td><xsl:value-of select="ancestor::feature//@os" /></td>
                      </tr>
                    </xsl:if>
                    <xsl:if test="ancestor::feature//@ws">
                      <tr>
                      <td>Windows Systems:</td>
                      <td><xsl:value-of select="ancestor::feature//@ws" /></td>
                      </tr>
                    </xsl:if>
                    <xsl:if test="ancestor::feature//@nl">
                      <tr>
                      <td>Languages:</td>
                      <td><xsl:value-of select="ancestor::feature//@nl" /></td>
                      </tr>
                    </xsl:if>
                    <xsl:if test="ancestor::feature//@arch">
                      <tr>
                      <td>Architecture:</td>
                      <td><xsl:value-of select="ancestor::feature//@arch" /></td>
                      </tr>
                    </xsl:if>
                  </table>
                </td>
  -->
              </tr>
              </xsl:for-each>
            </tbody>
          </xsl:if>
        </xsl:for-each>
      </table>

    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>

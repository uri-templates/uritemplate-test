<?xml version="1.0" encoding="utf-8"?>
<!-- Downloaded on 12/6/2012 from http://www.gerixsoft.com/blog/xslt/json2xml -->

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:include href="json2xml.xslt"/>

	<xsl:template match="/">
		<xsl:for-each select="('extended-tests', 'negative-tests', 'spec-examples-by-section', 'spec-examples')">
			<xsl:variable name="file" select="current()"/>
			<xsl:variable name="json">
				<json>
					<xsl:value-of select="unparsed-text(concat($file, '.json'))"/>
				</json>
			</xsl:variable>
			<xsl:variable name="xml">
				<xsl:apply-templates select="$json/json"/>
			</xsl:variable>
			<xsl:result-document href="{$file}.xml" method="xml" indent="yes">
				<tests>
					<xsl:for-each select="$xml/json/object/field">
						<test name="{@name}">
							<xsl:if test="exists(object/field[1][@name eq 'level'])">
								<xsl:attribute name="level" select="object/field[1][@name eq 'level']/integer/text()"/>
							</xsl:if>
							<variables>
								<xsl:for-each select="object/field[@name eq 'variables']/object/field">
									<variable name="{@name}">
										<xsl:copy-of select="*"/>
									</variable>
								</xsl:for-each>
							</variables>
							<testcases>
								<xsl:for-each select="object/field[@name eq 'testcases']/array/array">
									<testcase template="{*[1]}" result="{*[2]}"/>
								</xsl:for-each>									</testcases>
						</test>
					</xsl:for-each>
				</tests>
			</xsl:result-document>
		</xsl:for-each>
	</xsl:template>

</xsl:stylesheet>
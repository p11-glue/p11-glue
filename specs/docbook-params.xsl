<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!--
    Parameters for DocBook transformation.

    Copyright (C) 2009 Michael Leupold <lemma@confuego.org>

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public
    License along with this library; if not, write to the Free Software
    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
-->

	<xsl:param name="generate.toc">
		book     toc
		part     nop
		chapter  toc
		article  toc
	</xsl:param>

	<xsl:param name="html.stylesheet">style.css</xsl:param>
	<xsl:param name="refentry.generate.name">0</xsl:param>
	<xsl:param name="refentry.generate.title">1</xsl:param>
	<xsl:param name="section.autolabel">1</xsl:param>
	<xsl:param name="chunk.section.depth" select="0"></xsl:param>
	<xsl:param name="tox.max.depth" select="0"></xsl:param>
	<xsl:param name="toc.section.depth" select="1"></xsl:param>
	<xsl:param name="use.id.as.filename" select="1"></xsl:param>
</xsl:stylesheet>

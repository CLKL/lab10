<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : TimeCentric.xsl
    Created on : April 1, 2016, 9:12 PM
    Author     : Kelly
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Schedule for ACIT 4A</title>
            </head>
            <body>
                <h2>Start-time centric data</h2>
                <xsl:call-template name="startTime"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template name="startTime">
        <h1>Start Time of Classes</h1>
        <table>
            <tr>
                <th>Day</th>
                <th>Course</th>
                <th>Instructor</th>
                <th>Room</th>>
            </tr>
            <xsl:for-each select="/schedule/period[@time='1130']/booking">
                <xsl:sort select="@day"/>
                <xsl:call-template name="startTime_day"/>
            </xsl:for-each>
        </table>
    </xsl:template>

    <xsl:template name="startTime_day">
        <tr>
            <td>
                <xsl:value-of select="@day"/>
            </td>
            <td>
                <xsl:value-of select="@cn"/>
            </td>
            <td>
                <xsl:for-each select="/schedule/period[@time='1130']/booking/location">
                    <xsl:sort select="@room"/>
                    <xsl:call-template name="location"/>
                </xsl:for-each>
            </td>


        </tr>
    </xsl:template>
    
    <xsl:template name="location">
        <tr>
            <td>
                <xsl:value-of select="@room"/>
            </td>
            <td>
                <xsl:value-of select="@instructor"/>
            </td>




        </tr>
    </xsl:template>

</xsl:stylesheet>

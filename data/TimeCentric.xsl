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
                <xsl:call-template name="container"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template name="container">
        <h1>Start Time of Classes</h1>
        <table>
            <tr>
                <td>
                    <xsl:call-template name="startTime"/>
                </td>
                <td>
                    <xsl:call-template name="instructors"/>
                </td>
                <td>
                    <xsl:call-template name="rooms"/>
                </td>

            </tr>
            
        </table>
    </xsl:template>
    <xsl:template name="startTime">
        <table>
            <tr>
                <th>Day</th>
                <th>Time</th>
                <th>Course</th>

            </tr>
            <xsl:for-each select="/schedule/period[@time='1130']/booking">
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
                <xsl:value-of select="1130"/>   
            </td>
            <td>
                <xsl:value-of select="@cn"/>
            </td>
        </tr>
        
    </xsl:template>
    <xsl:template name="instructors">
        <table>
            <tr>
                <th>Instructor</th>
            </tr>

            <xsl:for-each select="/schedule/period[@time='1130']/booking/location">
                <xsl:call-template name="instructor"/>

            </xsl:for-each>
        </table>
    </xsl:template>
    <xsl:template name="instructor">
        <tr>
            <td>
                <xsl:value-of select="@instructor"/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template name="rooms">
        <table>
            <tr>
                <th>Room</th>>
            </tr>

            <xsl:for-each select="/schedule/period[@time='1130']/booking/location">
                <xsl:call-template name="room"/>

            </xsl:for-each>
        </table>
    </xsl:template>
    <xsl:template name="room">
        <tr>
            <td>
                <xsl:value-of select="@room"/>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>

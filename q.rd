<resource schema="vlassql">
<meta name="title">CIRADA VLASSQL component catalog</meta>
  <meta name="creationDate">2020-10-23T22:06:03</meta>
  <meta name="description">
     CIRADA Catalog of Very Large Array Sky Survey Epoch 1 Quick Look Components Survey
  </meta>
  <meta name="creator.name">Gordon et al. 2020</meta>

  <meta name="subject">Catalogs</meta>
  <meta name="subject">radio sources</meta>

  <meta name="coverage">
    <meta name="profile">AllSky ICRS</meta>
    <meta name="waveband">radio</meta>
   </meta>

   <meta name="source">
    Gordon et al. 2020, RNAAS
   </meta>

   <table id="main" onDisk="True" mixin="//scs#q3cindex" primary="Component_name">
    <index columns="RA,DEC"/>

   <column name="Component_name" type="text"
     ucd="meta.id;meta.main"
     tablehead="Component Name" verbLevel="1"
     description="Unique name of the PyBDSF component"
     required="True"/>

    <column name="RA" type="real"
      unit="deg" ucd="pos.eq.ra;meta.main"
      tablehead="RA" verbLevel="1"
      description="Right Ascension"
      required="True"/>

    <column name="DEC" type="real"
      unit="deg" ucd="pos.eq.dec;meta.main"
      tablehead="Dec" verbLevel="1"
      description="Declination"
      required="True"/>
      
    <column name="E_RA" type="real"
      unit="deg" ucd="pos.eq.ra"
      tablehead="E_RA" verbLevel="1"
      description="Right Ascension error"
      required="True"/>

    <column name="E_DEC" type="real"
      unit="deg" ucd="pos.eq.dec"
      tablehead="E_Dec" verbLevel="1"
      description="Declination error"
      required="True"/>

   <column name="Maj" type="real"
     unit="arcsec" ucd="pos.eq;pos.errorEllipse"
     tablehead="Major_Axis" verbLevel="1"
     description="Component major axis size (FWHM)"
     required="True"/>

   <column name="E_Maj" type="real"
     unit="arcsec" ucd="stat.error;pos.eq;pos.errorEllipse"
     tablehead="Major_Axis_error" verbLevel="1"
     description="Component major axis size (FWHM)"
     required="True"/>
     
   <column name="Min" type="real"
     unit="arcsec" ucd="pos.eq;pos.errorEllipse"
     tablehead="Minor_Axis" verbLevel="1"
     description="Component minor axis size (FWHM)"
     required="True"/>
 
    <column name="E_Min" type="real"
     unit="arcsec" ucd="stat.error;pos.eq;pos.errorEllipse"
     tablehead="Minor_Axis_error" verbLevel="1"
     description="Component minor axis size (FWHM)"
     required="True"/>
 
   <column name="PA" type="real"
     unit="milli Jansky" ucd="pos.posAng"
     tablehead="Position_Angle" verbLevel="1"
     description="Component position angle, east of north"
     required="True"/>

   <column name="E_PA" type="real"
     unit="milli Jansky" ucd="stat.error;pos.posAng"
     tablehead="Position_Angle_error" verbLevel="1"
     description="Error in PA"
     required="True"/>

   <column name="Total_flux" type="real"
     unit="milli Jansky" ucd="phot.flux.density;em.radio.3-6GHz"
     tablehead="Total_Flux" verbLevel="1"
     description="Integrated flux of the component"
     required="True"/>
    
   <column name="E_Total_flux" type="real"
     unit="milli Jansky" ucd="stat.error;phot.flux.density;em.radio.3-6GHz"
     tablehead="Total_Flux_error" verbLevel="1"
     description="Error in integrated flux"
     required="True"/>

   <column name="Duplicate_flag" type="integer"
     ucd="meta.code.qual "
     tablehead="Duplicate_flag" verbLevel="1"
     description="Flag to denote the duplicate status of a component"
     required="True"/>

   <column name="Quality_flag" type="integer"
     ucd="meta.code.qual "
     tablehead="Quality_flag" verbLevel="1"
     description="QA flag to deal with spurious detections and duplicates due to overlap between VLASS tile edges."
     required="True"/>

    <column name="Source_name" type="text"
      ucd="meta.id.assoc"
      tablehead="Source_name" verbLevel="1"
      description="Name of the distinct radio source to which this component has been assigned"
      required="True"/>
      
    <column name="Source_type" type="text"
      ucd="src.class"
      tablehead="Source_type" verbLevel="1"
      description="Flag to indicate the type of source the component has been assigned to"
      required="True"/>


  </table>

  <data id="import">
    <sources>vlassql.fits</sources>

    <fitsTableGrammar/>

    <make table="main">
      <rowmaker idmaps="*"/>
    </make>
  </data>

  <service id="cone" allowed="scs.xml,form">
    <meta name="title">VLASSQL catalog</meta>
    <meta name="shortName">VLASSQL cone</meta>
    <meta name="testQuery">
      <meta name="ra">20.02637</meta>
      <meta name="dec">21.98903</meta>
      <meta name="sr">1.0</meta>
    </meta>

    <dbCore queriedTable="main">
      <FEED source="//scs#coreDescs"/>
    </dbCore>

<!--
    <publish render="scs.xml" sets="local"/>
-->
    <publish render="form" sets="local"/>
    <outputTable verbLevel="20"/>
  </service>

</resource>

// If you would like more information on the gradle-appengine-plugin please refer to the github page
// https://github.com/GoogleCloudPlatform/gradle-appengine-plugin

buildscript {
    repositories {
        jcenter()
    }
    dependencies {
        classpath 'com.google.appengine:gradle-appengine-plugin:${appEngineVersion}'
    }
}

repositories {
    jcenter();
}

apply plugin: 'java'
apply plugin: 'war'
apply plugin: 'appengine'

sourceCompatibility = JavaVersion.VERSION_1_7
targetCompatibility = JavaVersion.VERSION_1_7

dependencies {
    appengineSdk 'com.google.appengine:appengine-java-sdk:${appEngineVersion}'
    compile 'com.google.appengine:appengine-endpoints:${appEngineVersion}'
    compile 'com.google.appengine:appengine-endpoints-deps:${appEngineVersion}'
    compile 'javax.servlet:servlet-api:2.5'
    compile 'com.googlecode.objectify:objectify:5.1.9'
    compile 'com.google.gcm:gcm-server:1.0.0'
}

appengine {
    downloadSdk = true
    appcfg {
        oauth2 = true
    }
    endpoints {
        getClientLibsOnBuild = true
        getDiscoveryDocsOnBuild = true
    }
}

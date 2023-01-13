#!/usr/bin/env groovy

node('java8'){
    
    stage("Check fields") {
            script {
                if (params.IP == '' || params.PASSWORD == ''|| params.ENVIROMENT == ''|| params.DC == '') {
                    echo "Parametros obrigatórios não preenchidos"
                    currentBuild.result = 'ABORTED'
                    error('Parametros obrigatórios não preenchidos')  
                    clean(1) 
                    }                
                }
            }

    stage('Executando imagem docker'){
         dir('install_sssd_alexandria'){
            try{     
            sh "git clone --branch install_sssd git@github.com:ps-corp-platform/ale-pgc-install-sssd repo && cd repo"
            sh "chmod +x build.sh && ./build.sh ${params.IP} ${params.PASSWORD} ${params.ENVIROMENT} ${params.DC}"
            clean(0)
            }catch(e){
                echo "$e"
                clean(1)
            }
        }
    }
}

    def clean(EXIT_CODE) {
    stage('clean') {
            sh(script: """
                rm --force --recursive install_sssd_alexandria && \\
                exit ${EXIT_CODE}
            """)
        }
    }
pipeline {
   agent any
  stages {
    stage('Checkout') {
       steps {
               git 'https://github.com/SubhashiniPenumatsa/Group2Labelf'
          }
     }

     stage('Robot') {
            steps {
                //bat 'robot --variable BROWSER:headlesschrome -d Results Tests'
                 bat 'robot -d Results Tests'
            
            
            }
            post {
                always {
                    script {
                        step(
                            [
                                $class                  :   'RobotPublisher',
                                outputPath              :   'Results',
                                outputFileName          :   '**/output.xml',
                                reportFileName          :   '**/report.html',
                                logFileName             :   '**/log.html',
                                disableArchiveOutput    :   false,
                                passThreshold           :   50,
                                unstableThreshold       :   40,
                                otherFiles              :   "**/*.png,**/*.jpg",
                            ]
                        )
                    }
                }
            }
                 
        }
             stage('newman') {
             steps {
                   
                     //bat 'newman run /Postman/Labelf.postman_collection.json --environment /Postman/LabelfProject.postman_environment.json'
                       bat'newman run /Postman/Labelf.postman_collection.json -e /Postman/LabelfProject.postman_environment.json  --reporters cli,json --reporter-json-export /Results/outputfile.json'
                }
              post {
                    always {
                            junit '**/*xml'
                        }
                }
        } 
}
}

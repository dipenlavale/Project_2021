  pipelineJob("Widgets_test") {
	description()
	keepDependencies(false)
	
	definition {
		cpsScm {
			scm {
				git {
					remote {
						url("git@github.com:dipenlavale/Project_2021.git")
						credentials('none')
					}
                  branch('${ReleaseBranch}')
				}
			}
			scriptPath("Jenkinsfile")
		}
	}
    parameters {
      gitParam("ReleaseBranch") {
        description('Release tag or branch')
        defaultValue('main')
        type('BRANCH_TAG')
	  }
    }
	disabled(false)
    triggers {
        bitbucketPush()
    }
	configure {
		it / 'properties' / 'com.sonyericsson.rebuild.RebuildSettings' {
			'autoRebuild'('false')
			'rebuildDisabled'('false')
		}
	}
}

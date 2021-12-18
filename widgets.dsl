  pipelineJob("Iris-Widgets/iris-widgets") {
	description()
	keepDependencies(false)
	
	definition {
		cpsScm {
			scm {
				git {
					remote {
						url("git@bitbucket.org:informa-ge/iris-widgets.git")
                        credentials('bitbucket-ssh')
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
        defaultValue('master')
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

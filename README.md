# upon thine inputs
 Demonstrates possible permission issues when WDLizing workflows which intend to directly modify an input file. Created as part of the process for debugging some issues with [the twice-localized workaround](https://github.com/DataBiosphere/analysis_pipeline_WDL/issues/2) used in the WDL conversions of the UWGAC pipelines.

 This should not be used as an example of good practice, but may be helpful to users testing permissions on certain backends.

## Potentially Inaccurate Hypothesis
 When Cromwell localizes a file -- whether it comes from a gs:// URI or another task -- that input file appears to end up with the `rw-r--r--` permissions.  

 If you are running Cromwell as root, you will be able to modify an input file directly. If you are not running as root, such as if you are running on Terra, you will not be able to modify an input file directly.

## Demonstration of Hypothesis
 When run locally via the Dockstore CLI, the workflow executes successfully and the input file has been modified.  

 When run on Terra, the workflow fails and the error cites a permissions conflict.


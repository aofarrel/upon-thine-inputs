# upon thine inputs
 Demonstrates possible permission issues when WDLizing workflows which intend to directly modify an input file. Created as part of the process for debugging some issues with [the twice-localized workaround](https://github.com/DataBiosphere/analysis_pipeline_WDL/issues/2) used in the WDL conversions of the UWGAC pipelines.

 This should not be used as an example of good practice, but may be helpful to users testing permissions on certain backends.

## Potentially Inaccurate Hypothesis
 When Cromwell localizes a file -- whether it comes from a gs:// URI or another task -- that input file appears to end up with the `rw-r--r--` permissions.  

 If you are running Cromwell as root, you will be able to modify an input file directly. If you are not running as root, such as if you are running on Terra, you will not be able to modify an input file directly. This can be problematic, as some scripts assume the ability to be able to modify input files directly.

## Demonstration of Hypothesis
 When run locally via the Dockstore CLI, the workflow executes successfully and the input file has been modified.  
 
 <img width="1047" alt="screenshot of Mac OS file structure of Cromwell directory, indicating that a file in the inputs directory has been modified" src="https://user-images.githubusercontent.com/27784612/127240106-870029fc-fd13-4d81-9ea3-ec84391af3ce.png">

 When run on Terra, the workflow fails and the error cites a permissions conflict.

<img width="864" alt="screenshot of Terra error log indicating permission has been denied to have write access upon the input file" src="https://user-images.githubusercontent.com/27784612/127240200-79163d5c-18c8-4eb0-a5a2-2e9a81c1cf32.png">

<h1>Code-book run_analysis.R</h1>

<h2>Reading the files</h2>
<p><strong>The files are expected to be in the working directory, in the same directories as in the zip file</strong>. So the features.txt in the working directory, all other files or in the test or in the train folders</p>
<p>The script reads the features file. This will be to assign column names when reading the data files</p>
<p>What it does for both the training and test data:</p>
<ol>
<li>Read the subject file and assign the column name "subject"</li>
<li>Read the activity file and assign the column name "activity"</li>
<li>Read the data file and assign the column names coming from the features file</li>
</ol>

<h2>Combining the files</h2>

<p>Now, for both the training and test files, it will bind the columns of all 3 files."subject" will be column 1, "activity" column 2 and then the data"</p>
<p>To get to the final big file, both training and test file will be combined</p>

<h2>Modify the column names</h2>
<p>Currently, the column names still contain several symbols</p>
<p>The column names are transformed to lower cases and the brackets and hyphens removed</p>

<h2>Get mean and stdev columns</h2>
<p>From all columns, only those containing "mean" and "std" are maintained for further analysis</p>

<h2>Calculate the mean for each group</h2>
<p>To allow for easier grouping and summarizing the data, the dataset is transformed into a data.table</p>
<p>Now, the data is grouped for each activity for each subject and the mean of these values is calculated<p>

<h2>Final words</h2>
<p>To improve readability, the tidy dataset is ordered by subject and activity</p>
<p>The final set consists of 180 rows and 88 columns (2 for subject and activity, 86 containing the averages).</p>


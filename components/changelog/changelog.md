
## v1.0 (2022-10-30)

### Functionality Additions

1.  This application is primary designed to demonstrate the **automated
    testing** in shiny R.
2.  It has “Application” tab in which user interface divided into two
    sections i.e. **Data Preview** and **Chart**.
3.  In the **Data Preview** section, user can select the dataset from
    *dropdown list* and can see the preview of selected dataset in the
    table. This entire functionality wrapped into a
    `getdataset_module.R` module and the corresponding module test
    written in `test-getdataset_module.R` file.
4.  Based on selected dataset in the **Data Preview** section, list of
    the variable in **Chart** section automatically updates. As soon as
    user selects the *variable* and *chart type* inputs, respective
    chart will be drawn in this section. User can see two type of charts
    which are “Histogram” and “Box-plot”.
5.  There is an information icon at right hand side corner of navigation
    bar. It has three sub-tabs i.e. `Session Info`, `Changelog` and
    `Testing`.
6.  `Session Info` gives the information about the current session of
    the application. `Changelog` provides the details of versions and
    `Testing` tab contains the latest output of test results.

### Bug Fixes

None

### Upcoming Features

None

### Contributor(s)

  - Mukul Mittal \<<Mukul.Mittal@sanofi.com>\>
  - Mayank Agrawal \<<mayankagrawal@quantzig.com>\>
  - Ramya Sri Pichikala \<<ramyasri@quantzig.com>\>
  - Sanjeev Kumar Rathore \<<sanjeevkumar@quantzig.com>\>

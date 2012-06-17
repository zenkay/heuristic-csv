HeuristicCsv
=============

Standard CSV library raise an exception when you try to read some malformed CSV data.
Sometimes you need to read readable data anyway. This gem adds to standard CSV library some methods to try to overcome the CSV::MalformedCSVError exception and read the data using RegExp to fix the malformed data.
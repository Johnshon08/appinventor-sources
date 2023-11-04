// -*- mode: swift; swift-mode:basic-offset: 2; -*-
// Copyright © 2022 Massachusetts Institute of Technology. All rights reserved.

import Foundation
import DGCharts

class LineChartBaseDataModel: PointChartDataModel<DGCharts.ChartDataEntry, DGCharts.LineChartData, DGCharts.LineChartView, LineChartView> {
  var chartDataEntry: Array<ChartDataEntry> = []
  override init(data: DGCharts.LineChartData, view: LineChartView) {
    super.init(data: data, view: view)
    var dataset: LineChartDataSet = LineChartDataSet(entries: chartDataEntry, label: " ")
    self.data.dataSets = [dataset]
    setDefaultStylingProperties()
  }
  
  public override func addEntryFromTuple(_ tuple: YailList<AnyObject>) {
    var entry: ChartDataEntry = getEntryFromTuple(tuple)
    if entry != nil { // TODO: how to compare it to nil
      var index: Int = entries.index(of: entry)!
      if index < 0 {
        index = -index - 1
      } else {
        var entryCount: Int = entries.count
        
        while index < entryCount && entries[index].x == entry.x {
          index += 1
        }
      }
      _entries.insert(entry, at: index)
    }
  }
  
  public override func setColors(_ colors: [Int32]) {
    super.setColors(colors)
    if let dataset = dataset as? DGCharts.LineChartDataSet {
      //dataset.setColors(<#T##colors: NSUIColor...##NSUIColor#>)
    }
  }
}


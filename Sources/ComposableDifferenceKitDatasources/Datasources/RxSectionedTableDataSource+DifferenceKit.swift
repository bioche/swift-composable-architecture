//
//  RxSectionedTableDataSource+DifferenceKit.swift
//  ComposableArchitecture
//
//  Created by Bioche on 29/07/2020.
//  Copyright © 2020 Bioche. All rights reserved.
//

import Foundation
import UIKit
import DifferenceKit
import ComposableArchitecture

extension RxSectionedTableDataSource where SectionModel: TCAIdentifiable, CellModel: TCAIdentifiable {
  public static func differenceKitReloading(animation: UITableView.RowAnimation) -> ReloadingClosure {
    return { tableView, datasource, observedEvent in
      let source = datasource.values
      let target = observedEvent.element ?? []
      let changeset = StagedChangeset(source: source, target: target)
      
      print("changeset : \(changeset)")
      
      tableView.reload(using: changeset, with: animation) { data in
        datasource.values = data
      }
    }
  }
}

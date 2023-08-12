# Copyright 2023 The FreePDM team. All rights reserved.
# Use of this source code is governed by a MIT-style
# license that can be found in the LICENSE file.

import os

import nimqt
import nimqt/[qdialog, qdialogbuttonbox, qfiledialog, qstringlist]
import nimqt/tools/load_ui

nimqt.init
let app = newQApplication(commandLineParams())

var rootWg: ptr Qdialog
rootWg.loadUi(curFileDir/"import_file.ui", createConnections = true) # , printLetStatements = true)

connect(buttonBox, SIGNAL "accepted()", rootWg, SLOT "apply_file()")
connect(buttonBox, SIGNAL "rejected()", rootWg, SLOT "cancel_file()")
connect(file_button, SIGNAL "file_button()", rootWg, SLOT "file_button_conn()")

# rejected(rootWg)

rootWg.show()
discard app.exec()


proc remove_the_file(this: ptr QDialog) =
    # TODO: Also ask whether to remove the backup file(s)
    echo("pressed")


proc cancel_file*(this: ptr QDialog) =
    # """Cancel file import"""
    echo("cancel button pushed")
    # rootWg.close()


proc file_button_conn*(this: ptr QDialog) =
    # """Select the file"""
    var dlg = newQFileDialog(this)
    dlg.setFileMode(QFileDialog_FileMode.AnyFile)
    let filters = newQStringList(@["FreeCAD files (*.FCStd)", "Any files (*)"])
    dlg.setNameFilters(filters)

    if dlg.exec().bool:
        let filenames = dlg.selectedFiles()
        echo filenames # self.ui.file_edit.setText(filenames[0])


proc apply_file*(this: ptr QDialog) =
    # """Apply file import"""
    echo("Ok button pushed")
    # TODO: Apply connection == save connection state
    discard


proc import_file_dialog*() =
    # """Start Import File dialog"""
    echo("dialog is running")
    # ImportFile(fs)

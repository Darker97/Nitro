//
//  Einstellungen.swift
//
//
//  Created by Christian Baltzer on 21.02.19.
//

import Foundation
import QuickTableViewController

final class Einstellungen: QuickTableViewController {
    @IBAction func zurückButton(_: Any) {
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableContents = [
            /*Section(title: "Switch", rows: [
                SwitchRow(title: "NFC", switchValue: main.NFCEnabled, action: { _ in
                    main.NFCEnabled = !main.NFCEnabled
                }),
                SwitchRow(title: "Fingerabdruck", switchValue: main.TouchIdEnabled, action: { _ in
                    main.TouchIdEnabled = !main.TouchIdEnabled
                }),
            ]),*/

            RadioSection(title: "Fachbereich", options: [
                OptionRow(title: "Angewandte Informatik", isSelected: main.FachbereichAuswahl == 0, action: didToggleSelection()),
                OptionRow(title: "Elektrotechnik und Informationstechnik", isSelected: main.FachbereichAuswahl == 1, action: didToggleSelection()),
                OptionRow(title: "Lebensmitteltechnik", isSelected: main.FachbereichAuswahl == 2, action: didToggleSelection()),
                OptionRow(title: "Oecotrophologie", isSelected: main.FachbereichAuswahl == 3, action: didToggleSelection()),
                OptionRow(title: "Pflege und Gesundheit", isSelected: main.FachbereichAuswahl == 4, action: didToggleSelection()),
                OptionRow(title: "Sozial-& Kulturwissenschaft", isSelected: main.FachbereichAuswahl == 5, action: didToggleSelection()),
                OptionRow(title: "Sozialwesen", isSelected: main.FachbereichAuswahl == 6, action: didToggleSelection()),
                OptionRow(title: "Wirtschaft", isSelected: main.FachbereichAuswahl == 7, action: didToggleSelection()),
            ]),
        ]
    }

    // MARK: - Actions

    private func showAlert(_: Row) {}

    /// Aktion der Fachbereichsauswahl
    private func didToggleSelection() -> (Row) -> Void {
        return { [weak self] row in
            // Neusetzten des Auswahl Integers
            switch row.title {
            case "Angewandte Informatik": main.FachbereichAuswahl = 0
            case "Elektrotechnik und Informationstechnik": main.FachbereichAuswahl = 1
            case "Lebensmitteltechnik": main.FachbereichAuswahl = 2
            case "Oecotrophologie": main.FachbereichAuswahl = 3
            case "Pflege und Gesundheit": main.FachbereichAuswahl = 4
            case "Sozial-& Kulturwissenschaft": main.FachbereichAuswahl = 5
            case "Sozialwesen": main.FachbereichAuswahl = 6
            case "Wirtschaft": main.FachbereichAuswahl = 7
            default:
                main.FachbereichAuswahl = 0
            }
        }
    }
}

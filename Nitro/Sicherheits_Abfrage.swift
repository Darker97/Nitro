//
//  NFC-Abfrage.swift
//  Nitro
//
//  Created by Christian Baltzer on 19.11.18.
//  Copyright © 2018 Christian Baltzer. All rights reserved.
//

import CoreNFC
import LocalAuthentication
import UIKit

class Sicherheits_Abfrage: UIViewController, NFCNDEFReaderSessionDelegate {
    // Bau der Sicherheitsabfrage

    @IBOutlet var TouchIDButton: UIButton!

    @IBOutlet var start_button: UIButton!
    var nfcSession: NFCNDEFReaderSession?
    @IBOutlet var NameInput: UITextField!
    @IBOutlet var PasswortInput: UITextField!

    @IBOutlet var AnmeldungFehgelschlagen: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Abfrgage ob die einzelnen Optionen aktiv sind
        if main.NFCEnabled == false {
            start_button.isHidden = true
        }
        if main.TouchIdEnabled == false {
            TouchIDButton.isHidden = true
        }
    }

    // -----------------------------------------------------------------------
    // NFC - Scan
    @IBAction func scanPressed(_: Any) {
        nfcSession = NFCNDEFReaderSession(delegate: self, queue: nil, invalidateAfterFirstRead: true)
        nfcSession?.begin()
    }

    func readerSession(_: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        print("The session was invalidated: \(error.localizedDescription)")
    }

    func readerSession(_: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        // Auslesen des NFC Signales
        // print (messages[0])

        var Ergebnis = ""
        for payload in messages[0].records {
            Ergebnis += String(data: payload.payload.advanced(by: 3), encoding: .utf8)!
        }
        print(Ergebnis)
        // Wenn das NFC Signal gleich ist mit der Passfrase wird weitergeleitet
        if Ergebnis.range(of: main.NFCCoder) != nil {
            testErfolgreich()
        }
        // (Ergebnis == main.NFCCoder)
    }

    // ------------------------------------------------------------------------
    // Funktion um TouchID als Alternative einzuführen
    @IBAction func TouchIdButton(_: Any) {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Identify yourself!"

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                [unowned self] success, _ in

                DispatchQueue.main.async {
                    if success {
                        self.testErfolgreich()
                    } else {
                        let ac = UIAlertController(title: "Fehler", message: "Sorry!", preferredStyle: .alert)
                        ac.addAction(UIAlertAction(title: "Zurück zum Hautmenü", style: .default))
                        self.present(ac, animated: true)
                        self.performSegue(withIdentifier: "AnmeldungFehleschlagen", sender: nil)
                    }
                }
            }
        } else {
            let ac = UIAlertController(title: "Touch ID nicht möglich", message: "Touch ID ist nicht aktiviert", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }

    // ------------------------------------------------------------------------
    // Funktion um die Passswortabfrage durchzuführen
    @IBAction func anmeldeButton(_: Any) {
        /*
         if(){
         testErfolgreich()

         }
         else{
         AnmeldungFehgelschlagen.isHidden = false
         }*/
    }

    // ------------------------------------------------------------------------
    // Wenn alles korrekt ist gehen wir weiter
    func testErfolgreich() {
        performSegue(withIdentifier: "NFC-AbfrageKorrekt", sender: nil)
    }

    // ------------------------------------------------------------------------
    // zurück Button
    @IBAction func zurück(_: Any) {
        dismiss(animated: true, completion: nil)
    }
}

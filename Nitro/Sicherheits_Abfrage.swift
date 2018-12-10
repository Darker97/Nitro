//
//  NFC-Abfrage.swift
//  Nitro
//
//  Created by Christian Baltzer on 19.11.18.
//  Copyright © 2018 Christian Baltzer. All rights reserved.
//

import UIKit
import CoreNFC
import LocalAuthentication

class Sicherheits_Abfrage: UIViewController, NFCNDEFReaderSessionDelegate {
    

    //Bau der Sicherheitsabfrage
    
    @IBOutlet weak var TouchIDButton: UIButton!

    @IBOutlet weak var start_button: UIButton!
    var nfcSession: NFCNDEFReaderSession?
    @IBOutlet weak var NameInput: UITextField!
    @IBOutlet weak var PasswortInput: UITextField!
    
    @IBOutlet weak var AnmeldungFehgelschlagen: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Abfrgage ob die einzelnen Optionen aktiv sind
        if(HardCodedVar().NFCEnabled == false){
            start_button.isHidden = true
        }
        if (HardCodedVar().TouchIdEnabled == false){
            TouchIDButton.isHidden = true
        }


    }

    
    //-----------------------------------------------------------------------
    //NFC - Scan
    @IBAction func scanPressed(_ sender: Any) {
        nfcSession = NFCNDEFReaderSession.init(delegate: self, queue: nil, invalidateAfterFirstRead: true)
        nfcSession?.begin()
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        print("The session was invalidated: \(error.localizedDescription)")
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        // Auslesen des NFC Signales
        //print (messages[0])
        
        
        var Ergebnis = ""
        for payload in messages[0].records {
            Ergebnis += String.init(data: payload.payload.advanced(by: 3), encoding: .utf8)!
        }
        print (Ergebnis)
        //Wenn das NFC Signal gleich ist mit der Passfrase wird weitergeleitet
        if Ergebnis.range(of:HardCodedVar().NFCCoder) != nil{
            testErfolgreich()
        }
        //(Ergebnis == HardCodedVar().NFCCoder)
    }
    //------------------------------------------------------------------------
    //Funktion um TouchID als Alternative einzuführen
    @IBAction func TouchIdButton(_ sender: Any) {
        
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Identify yourself!"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                [unowned self] success, authenticationError in
                
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
    
    //------------------------------------------------------------------------
    //Funktion um die Passswortabfrage durchzuführen
    @IBAction func anmeldeButton(_ sender: Any) {
        
        /*
        if(){
            testErfolgreich()
            
        }
        else{
            AnmeldungFehgelschlagen.isHidden = false
        }*/
    }
    
    
    
    
    
    
    //------------------------------------------------------------------------
    //Wenn alles korrekt ist gehen wir weiter
    func testErfolgreich(){
        self.performSegue(withIdentifier: "NFC-AbfrageKorrekt", sender: nil)
    }
    

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

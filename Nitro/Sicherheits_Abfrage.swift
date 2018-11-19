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
    

    //Bau einer NFC Abfrage zum anmelden mit einem NFC Key.
    
    @IBOutlet weak var TouchIDButton: UIButton!

    @IBOutlet weak var start_button: UIButton!
    var nfcSession: NFCNDEFReaderSession?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
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

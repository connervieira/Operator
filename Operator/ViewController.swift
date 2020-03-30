//
//  ViewController.swift
//  Operator
//
//  Created by Conner Vieira on 6/23/19.
//  Copyright © 2019 V0LT. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    var ClearedToCheck = true;
    
    var StatusUnknown = false;
    
    var TemperatureCleared = false;
    var AltitudeCleared = false;
    var HumidityCleared = false;

    
    
    @IBOutlet weak var Device: NSPopUpButton!
    @IBOutlet weak var Year: NSPopUpButton!
    @IBOutlet weak var Temperature: NSTextField!
    @IBOutlet weak var Humidity: NSTextField!
    @IBOutlet weak var Altitude: NSTextField!
    
    
    @IBOutlet weak var Operation: NSPopUpButton!
    
    @IBOutlet weak var UsingMenuItem: NSMenuItem!
    @IBOutlet weak var StorageMenuItem: NSMenuItem!
    
    
    @IBOutlet weak var ConditionStatus: NSTextField!
    
    
    @IBOutlet weak var MacBook: NSMenuItem!
    @IBOutlet weak var MacBookAir: NSMenuItem!
    @IBOutlet weak var MacBookPro: NSMenuItem!
    @IBOutlet weak var iMac: NSMenuItem!
    @IBOutlet weak var iMacPro: NSMenuItem!
    @IBOutlet weak var MacMini: NSMenuItem!
    
    @IBOutlet weak var Year2018: NSMenuItem!
    
    
    @IBOutlet weak var TemperatureError: NSLevelIndicator!
    @IBOutlet weak var TemperatureWarning: NSLevelIndicator!
    @IBOutlet weak var TemperatureClear: NSLevelIndicator!
    
    @IBOutlet weak var HumidityError: NSLevelIndicator!
    @IBOutlet weak var HumidityWarning: NSLevelIndicator!
    @IBOutlet weak var HumidityClear: NSLevelIndicator!
    
    @IBOutlet weak var AltitudeError: NSLevelIndicator!
    @IBOutlet weak var AltitudeWarning: NSLevelIndicator!
    @IBOutlet weak var AltitudeClear: NSLevelIndicator!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        HumidityError.isHidden = true;
        HumidityClear.isHidden = true;
        HumidityWarning.isHidden = true;
        
        TemperatureError.isHidden = true;
        TemperatureClear.isHidden = true;
        TemperatureWarning.isHidden = true;
        
        AltitudeError.isHidden = true;
        AltitudeClear.isHidden = true;
        AltitudeWarning.isHidden = true;
    }

    @IBAction func CheckConditions(_ sender: Any) {
        ClearedToCheck = true;
        
        if (Humidity.intValue > 100) { // If humidity is over 100%, display format error indicator
            HumidityError.isHidden = false;
            HumidityClear.isHidden = true;
            HumidityWarning.isHidden = true;
            ClearedToCheck = false; // Mark process as not cleared to continue for later
        } else if (Humidity.intValue < 0) { // If humidity is less than 0%, display format error indicator
            HumidityError.isHidden = false;
            HumidityClear.isHidden = true;
            HumidityWarning.isHidden = true;
            ClearedToCheck = false; // Mark process as not cleared to continue for later
        } else if (Temperature.intValue < -460) { // If temperature is less than -460f, display format error indicator, since this falls below absolute zero.
            TemperatureError.isHidden = false;
            TemperatureClear.isHidden = true;
            TemperatureWarning.isHidden = true;
            ClearedToCheck = false; // Mark process as not cleared to continue for later
        } else { // If else, then display no error indicator
            HumidityError.isHidden = true;
            HumidityClear.isHidden = true;
            HumidityWarning.isHidden = true;
        }
        
        if (ClearedToCheck == true) { // If process is still cleared to run after formatting check, then run.
            StatusUnknown = false;
            
            // Run checks based on every Apple device techincal specifications since 2000
            if (Device.selectedItem == MacBookPro) {
                if (Operation.selectedItem == UsingMenuItem) {
                    if (Temperature.intValue >= 50 && Temperature.intValue <= 95) {
                        TemperatureCleared = true;
                        
                        TemperatureError.isHidden = true;
                        TemperatureClear.isHidden = false;
                        TemperatureWarning.isHidden = true;
                    } else {
                        TemperatureCleared = false;
                        
                        TemperatureError.isHidden = true;
                        TemperatureClear.isHidden = true;
                        TemperatureWarning.isHidden = false;
                    }
                    
                    if (Humidity.intValue >= 0 && Temperature.intValue <= 90) {
                        HumidityCleared = true;
                        
                        HumidityError.isHidden = true;
                        HumidityClear.isHidden = false;
                        HumidityWarning.isHidden = true;
                    } else {
                        HumidityCleared = false;
                        
                        HumidityError.isHidden = true;
                        HumidityClear.isHidden = true;
                        HumidityWarning.isHidden = false;
                    }
                    
                    if (Altitude.intValue <= 10000) {
                        AltitudeCleared = true;
                        
                        AltitudeError.isHidden = true;
                        AltitudeClear.isHidden = false;
                        AltitudeWarning.isHidden = true;
                    } else {
                        AltitudeCleared = false;
                        
                        AltitudeError.isHidden = true;
                        AltitudeClear.isHidden = true;
                        AltitudeWarning.isHidden = false;
                    }
                } else if (Operation.selectedItem == StorageMenuItem) {
                    if (Temperature.intValue >= -13 && Temperature.intValue <= 113) {
                        TemperatureCleared = true;
                        
                        TemperatureError.isHidden = true;
                        TemperatureClear.isHidden = false;
                        TemperatureWarning.isHidden = true;
                    } else {
                        TemperatureCleared = false;
                        
                        TemperatureError.isHidden = true;
                        TemperatureClear.isHidden = true;
                        TemperatureWarning.isHidden = false;
                    }
                    
                    if (Humidity.intValue >= 0 && Temperature.intValue <= 90) {
                        HumidityCleared = true;
                        
                        HumidityError.isHidden = true;
                        HumidityClear.isHidden = false;
                        HumidityWarning.isHidden = true;
                    } else {
                        HumidityCleared = false;
                        
                        HumidityError.isHidden = true;
                        HumidityClear.isHidden = true;
                        HumidityWarning.isHidden = false;
                    }
                    
                    if (Altitude.intValue <= 15000) {
                        AltitudeCleared = true;
                        
                        AltitudeError.isHidden = true;
                        AltitudeClear.isHidden = false;
                        AltitudeWarning.isHidden = true;
                    } else {
                        AltitudeCleared = false;
                        
                        AltitudeError.isHidden = true;
                        AltitudeClear.isHidden = true;
                        AltitudeWarning.isHidden = false;
                    }
                }
            } else if (Device.selectedItem == MacBook) {
                if (Operation.selectedItem == UsingMenuItem) {
                    if (Temperature.intValue >= 50 && Temperature.intValue <= 95) {
                        TemperatureCleared = true;
                        
                        TemperatureError.isHidden = true;
                        TemperatureClear.isHidden = false;
                        TemperatureWarning.isHidden = true;
                    } else {
                        TemperatureCleared = false;
                        
                        TemperatureError.isHidden = true;
                        TemperatureClear.isHidden = true;
                        TemperatureWarning.isHidden = false;
                    }
                    
                    if (Humidity.intValue >= 0 && Temperature.intValue <= 90) {
                        HumidityCleared = true;
                        
                        HumidityError.isHidden = true;
                        HumidityClear.isHidden = false;
                        HumidityWarning.isHidden = true;
                    } else {
                        HumidityCleared = false;
                        
                        HumidityError.isHidden = true;
                        HumidityClear.isHidden = true;
                        HumidityWarning.isHidden = false;
                    }
                    
                    if (Altitude.intValue <= 10000) {
                        AltitudeCleared = true;
                        
                        AltitudeError.isHidden = true;
                        AltitudeClear.isHidden = false;
                        AltitudeWarning.isHidden = true;
                    } else {
                        AltitudeCleared = false;
                        
                        AltitudeError.isHidden = true;
                        AltitudeClear.isHidden = true;
                        AltitudeWarning.isHidden = false;
                    }
                } else if (Operation.selectedItem == StorageMenuItem) {
                    if (Temperature.intValue >= -13 && Temperature.intValue <= 113) {
                        TemperatureCleared = true;
                        
                        TemperatureError.isHidden = true;
                        TemperatureClear.isHidden = false;
                        TemperatureWarning.isHidden = true;
                    } else {
                        TemperatureCleared = false;
                        
                        TemperatureError.isHidden = true;
                        TemperatureClear.isHidden = true;
                        TemperatureWarning.isHidden = false;
                    }
                    
                    if (Humidity.intValue >= 0 && Temperature.intValue <= 90) {
                        HumidityCleared = true;
                        
                        HumidityError.isHidden = true;
                        HumidityClear.isHidden = false;
                        HumidityWarning.isHidden = true;
                    } else {
                        HumidityCleared = false;
                        
                        HumidityError.isHidden = true;
                        HumidityClear.isHidden = true;
                        HumidityWarning.isHidden = false;
                    }
                    
                    if (Altitude.intValue <= 15000) {
                        AltitudeCleared = true;
                        
                        AltitudeError.isHidden = true;
                        AltitudeClear.isHidden = false;
                        AltitudeWarning.isHidden = true;
                    } else {
                        AltitudeCleared = false;
                        
                        AltitudeError.isHidden = true;
                        AltitudeClear.isHidden = true;
                        AltitudeWarning.isHidden = false;
                    }
                }
            } else if (Device.selectedItem == MacBookAir) {
                if (Operation.selectedItem == UsingMenuItem) {
                    if (Temperature.intValue >= 50 && Temperature.intValue <= 95) {
                        TemperatureCleared = true;
                        
                        TemperatureError.isHidden = true;
                        TemperatureClear.isHidden = false;
                        TemperatureWarning.isHidden = true;
                    } else {
                        TemperatureCleared = false;
                        
                        TemperatureError.isHidden = true;
                        TemperatureClear.isHidden = true;
                        TemperatureWarning.isHidden = false;
                    }
                    
                    if (Humidity.intValue >= 0 && Temperature.intValue <= 90) {
                        HumidityCleared = true;
                        
                        HumidityError.isHidden = true;
                        HumidityClear.isHidden = false;
                        HumidityWarning.isHidden = true;
                    } else {
                        HumidityCleared = false;
                        
                        HumidityError.isHidden = true;
                        HumidityClear.isHidden = true;
                        HumidityWarning.isHidden = false;
                    }
                    
                    if (Altitude.intValue <= 10000) {
                        AltitudeCleared = true;
                        
                        AltitudeError.isHidden = true;
                        AltitudeClear.isHidden = false;
                        AltitudeWarning.isHidden = true;
                    } else {
                        AltitudeCleared = false;
                        
                        AltitudeError.isHidden = true;
                        AltitudeClear.isHidden = true;
                        AltitudeWarning.isHidden = false;
                    }
                } else if (Operation.selectedItem == StorageMenuItem) {
                    if (Temperature.intValue >= -13 && Temperature.intValue <= 113) {
                        TemperatureCleared = true;
                        
                        TemperatureError.isHidden = true;
                        TemperatureClear.isHidden = false;
                        TemperatureWarning.isHidden = true;
                    } else {
                        TemperatureCleared = false;
                        
                        TemperatureError.isHidden = true;
                        TemperatureClear.isHidden = true;
                        TemperatureWarning.isHidden = false;
                    }
                    
                    if (Humidity.intValue >= 0 && Temperature.intValue <= 90) {
                        HumidityCleared = true;
                        
                        HumidityError.isHidden = true;
                        HumidityClear.isHidden = false;
                        HumidityWarning.isHidden = true;
                    } else {
                        HumidityCleared = false;
                        
                        HumidityError.isHidden = true;
                        HumidityClear.isHidden = true;
                        HumidityWarning.isHidden = false;
                    }
                    
                    if (Altitude.intValue <= 15000) {
                        AltitudeCleared = true;
                        
                        AltitudeError.isHidden = true;
                        AltitudeClear.isHidden = false;
                        AltitudeWarning.isHidden = true;
                    } else {
                        AltitudeCleared = false;
                        
                        AltitudeError.isHidden = true;
                        AltitudeClear.isHidden = true;
                        AltitudeWarning.isHidden = false;
                    }
                }
            } else if (Device.selectedItem == iMac) {
                if (Operation.selectedItem == UsingMenuItem) {
                    if (Temperature.intValue >= 50 && Temperature.intValue <= 95) {
                        TemperatureCleared = true;
                        
                        TemperatureError.isHidden = true;
                        TemperatureClear.isHidden = false;
                        TemperatureWarning.isHidden = true;
                    } else {
                        TemperatureCleared = false;
                        
                        TemperatureError.isHidden = true;
                        TemperatureClear.isHidden = true;
                        TemperatureWarning.isHidden = false;
                    }
                    
                    if (Humidity.intValue >= 5 && Temperature.intValue <= 95) {
                        HumidityCleared = true;
                        
                        HumidityError.isHidden = true;
                        HumidityClear.isHidden = false;
                        HumidityWarning.isHidden = true;
                    } else {
                        HumidityCleared = false;
                        
                        HumidityError.isHidden = true;
                        HumidityClear.isHidden = true;
                        HumidityWarning.isHidden = false;
                    }
                    
                    if (Altitude.intValue <= 10000) {
                        AltitudeCleared = true;
                        
                        AltitudeError.isHidden = true;
                        AltitudeClear.isHidden = false;
                        AltitudeWarning.isHidden = true;
                    } else {
                        AltitudeCleared = false;
                        
                        AltitudeError.isHidden = true;
                        AltitudeClear.isHidden = true;
                        AltitudeWarning.isHidden = false;
                    }
                } else if (Operation.selectedItem == StorageMenuItem) {
                    StatusUnknown = true
                }
            } else if (Device.selectedItem == iMacPro) {
                if (Operation.selectedItem == UsingMenuItem) {
                    if (Temperature.intValue >= 50 && Temperature.intValue <= 95) {
                        TemperatureCleared = true;
                        
                        TemperatureError.isHidden = true;
                        TemperatureClear.isHidden = false;
                        TemperatureWarning.isHidden = true;
                    } else {
                        TemperatureCleared = false;
                        
                        TemperatureError.isHidden = true;
                        TemperatureClear.isHidden = true;
                        TemperatureWarning.isHidden = false;
                    }
                    
                    if (Humidity.intValue >= 5 && Temperature.intValue <= 95) {
                        HumidityCleared = true;
                        
                        HumidityError.isHidden = true;
                        HumidityClear.isHidden = false;
                        HumidityWarning.isHidden = true;
                    } else {
                        HumidityCleared = false;
                        
                        HumidityError.isHidden = true;
                        HumidityClear.isHidden = true;
                        HumidityWarning.isHidden = false;
                    }
                    
                    if (Altitude.intValue <= 16400) {
                        AltitudeCleared = true;
                        
                        AltitudeError.isHidden = true;
                        AltitudeClear.isHidden = false;
                        AltitudeWarning.isHidden = true;
                    } else {
                        AltitudeCleared = false;
                        
                        AltitudeError.isHidden = true;
                        AltitudeClear.isHidden = true;
                        AltitudeWarning.isHidden = false;
                    }
                } else if (Operation.selectedItem == StorageMenuItem) {
                    StatusUnknown = true;
                }
            } else if (Device.selectedItem == MacMini) {
                if (Year.selectedItem != Year2018) {
                    if (Operation.selectedItem == UsingMenuItem) {
                        if (Temperature.intValue >= 50 && Temperature.intValue <= 95) {
                            TemperatureCleared = true;
                            
                            TemperatureError.isHidden = true;
                            TemperatureClear.isHidden = false;
                            TemperatureWarning.isHidden = true;
                        } else {
                            TemperatureCleared = false;
                            
                            TemperatureError.isHidden = true;
                            TemperatureClear.isHidden = true;
                            TemperatureWarning.isHidden = false;
                        }
                        
                        if (Humidity.intValue >= 5 && Temperature.intValue <= 95) {
                            HumidityCleared = true;
                            
                            HumidityError.isHidden = true;
                            HumidityClear.isHidden = false;
                            HumidityWarning.isHidden = true;
                        } else {
                            HumidityCleared = false;
                            
                            HumidityError.isHidden = true;
                            HumidityClear.isHidden = true;
                            HumidityWarning.isHidden = false;
                        }
                        
                        if (Altitude.intValue <= 10000) {
                            AltitudeCleared = true;
                            
                            AltitudeError.isHidden = true;
                            AltitudeClear.isHidden = false;
                            AltitudeWarning.isHidden = true;
                        } else {
                            AltitudeCleared = false;
                            
                            AltitudeError.isHidden = true;
                            AltitudeClear.isHidden = true;
                            AltitudeWarning.isHidden = false;
                        }
                    } else if (Operation.selectedItem == StorageMenuItem) {
                if (Temperature.intValue >= -40 && Temperature.intValue <= 116) {
                    TemperatureCleared = true;
                    
                    TemperatureError.isHidden = true;
                    TemperatureClear.isHidden = false;
                    TemperatureWarning.isHidden = true;
                } else {
                    TemperatureCleared = false;
                    
                    TemperatureError.isHidden = true;
                    TemperatureClear.isHidden = true;
                    TemperatureWarning.isHidden = false;
                }
                
                if (Humidity.intValue >= 5 && Temperature.intValue <= 95) {
                    HumidityCleared = true;
                    
                    HumidityError.isHidden = true;
                    HumidityClear.isHidden = false;
                    HumidityWarning.isHidden = true;
                } else {
                    HumidityCleared = false;
                    
                    HumidityError.isHidden = true;
                    HumidityClear.isHidden = true;
                    HumidityWarning.isHidden = false;
                }
                
                if (Altitude.intValue <= 10000) {
                    AltitudeCleared = true;
                    
                    AltitudeError.isHidden = true;
                    AltitudeClear.isHidden = false;
                    AltitudeWarning.isHidden = true;
                } else {
                    AltitudeCleared = false;
                    
                    AltitudeError.isHidden = true;
                    AltitudeClear.isHidden = true;
                    AltitudeWarning.isHidden = false;
                }
            }
                } else {
                    if (Operation.selectedItem == UsingMenuItem) {
                        if (Temperature.intValue >= 50 && Temperature.intValue <= 95) {
                            TemperatureCleared = true;
                            
                            TemperatureError.isHidden = true;
                            TemperatureClear.isHidden = false;
                            TemperatureWarning.isHidden = true;
                        } else {
                            TemperatureCleared = false;
                            
                            TemperatureError.isHidden = true;
                            TemperatureClear.isHidden = true;
                            TemperatureWarning.isHidden = false;
                        }
                        
                        if (Humidity.intValue >= 5 && Temperature.intValue <= 90) {
                            HumidityCleared = true;
                            
                            HumidityError.isHidden = true;
                            HumidityClear.isHidden = false;
                            HumidityWarning.isHidden = true;
                        } else {
                            HumidityCleared = false;
                            
                            HumidityError.isHidden = true;
                            HumidityClear.isHidden = true;
                            HumidityWarning.isHidden = false;
                        }
                        
                        if (Altitude.intValue <= 16400) {
                            AltitudeCleared = true;
                            
                            AltitudeError.isHidden = true;
                            AltitudeClear.isHidden = false;
                            AltitudeWarning.isHidden = true;
                        } else {
                            AltitudeCleared = false;
                            
                            AltitudeError.isHidden = true;
                            AltitudeClear.isHidden = true;
                            AltitudeWarning.isHidden = false;
                        }
                    } else if (Operation.selectedItem == StorageMenuItem) {
                        if (Temperature.intValue >= -40 && Temperature.intValue <= 116) {
                            TemperatureCleared = true;
                            
                            TemperatureError.isHidden = true;
                            TemperatureClear.isHidden = false;
                            TemperatureWarning.isHidden = true;
                        } else {
                            TemperatureCleared = false;
                            
                            TemperatureError.isHidden = true;
                            TemperatureClear.isHidden = true;
                            TemperatureWarning.isHidden = false;
                        }
                        
                        if (Humidity.intValue >= 5 && Temperature.intValue <= 90) {
                            HumidityCleared = true;
                            
                            HumidityError.isHidden = true;
                            HumidityClear.isHidden = false;
                            HumidityWarning.isHidden = true;
                        } else {
                            HumidityCleared = false;
                            
                            HumidityError.isHidden = true;
                            HumidityClear.isHidden = true;
                            HumidityWarning.isHidden = false;
                        }
                        
                        if (Altitude.intValue <= 16400) {
                            AltitudeCleared = true;
                            
                            AltitudeError.isHidden = true;
                            AltitudeClear.isHidden = false;
                            AltitudeWarning.isHidden = true;
                        } else {
                            AltitudeCleared = false;
                            
                            AltitudeError.isHidden = true;
                            AltitudeClear.isHidden = true;
                            AltitudeWarning.isHidden = false;
                        }
                    }
                }
            }
            
            if (TemperatureCleared == true && HumidityCleared == true && AltitudeCleared == true) { // If all 3 metrics are clear, then tell user that the conditions are cleared
                ConditionStatus.stringValue = "Cleared";
            } else if (StatusUnknown == true) { // If a device metric wasn't in the database, then tell the user that it is unknown whether or not the conditions are cleared.
                ConditionStatus.stringValue = "Unknown";
            } else { // If any metric wasn't passed, the display that the user isn't cleared to use the device.
                ConditionStatus.stringValue = "Not Cleared";
            }
            
            
        } else { // If the user entered a metric in an invalid format, then display an error
            ConditionStatus.stringValue = "Entry Error";
        }
    }
    
}


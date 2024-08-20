import UIKit
import AVFoundation

extension AVCaptureDevice {
    /**
     * - Reference: https://stackoverflow.com/a/50450425/5389500
     * - Throws: an NSError describing why the failure occurred
     */
    @objc open func focusWithMode(focusMode: AVCaptureDevice.FocusMode, exposureMode: AVCaptureDevice.ExposureMode, point: CGPoint, monitorSubjectAreaChange: Bool) throws {
        try self.lockForConfiguration()
        
        // FaceDriveAutoFocus to be disabled.
        self.automaticallyAdjustsFaceDrivenAutoFocusEnabled = false
        self.isFaceDrivenAutoFocusEnabled = false
        
        if self.isFocusPointOfInterestSupported && self.isFocusModeSupported(focusMode) {
            self.focusMode = focusMode
            self.focusPointOfInterest = point
        }
        
        // FaceDrivenAutoExposure to be disabled.
        self.automaticallyAdjustsFaceDrivenAutoExposureEnabled = false
        self.isFaceDrivenAutoExposureEnabled = false
        
        if self.isExposurePointOfInterestSupported && self.isExposureModeSupported(exposureMode) {
            self.exposurePointOfInterest = point
            self.exposureMode = exposureMode
        }
        
        self.isSubjectAreaChangeMonitoringEnabled = monitorSubjectAreaChange
        self.unlockForConfiguration()
    }
}

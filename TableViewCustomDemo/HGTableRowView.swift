//
//  HGTableRowView.swift
//  TableViewCustomDemo
//
//  Created by HamGuy on 13/01/2017.
//  Copyright © 2017 HamGuy. All rights reserved.
//

import Cocoa



class HGTableRowView: NSTableRowView {
    
    @IBInspectable var selectionBackgroundColor: NSColor! = .clear
    @IBInspectable var normalBackgroundColor: NSColor! = .white
    
    
    
    fileprivate lazy var trackingArea: NSTrackingArea = {
        let area = NSTrackingArea(rect: NSRect.zero, options: [.inVisibleRect,.activeAlways,.mouseEnteredAndExited], owner: self, userInfo: nil)
        return area
    }()
    
    override func updateTrackingAreas() {
        super.updateTrackingAreas()
        if !trackingAreas.contains(trackingArea){
            addTrackingArea(trackingArea)
        }
    }
    
    fileprivate var mouseInside = false{
        didSet{
            self.needsDisplay = true
        }
    }
    
    override func mouseEntered(with event: NSEvent) {
        mouseInside = true
    }
    
    override func mouseExited(with event: NSEvent) {
        mouseInside = false
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
    }
    
    override func drawDraggingDestinationFeedback(in dirtyRect: NSRect) {
        selectionBackgroundColor.set()
        NSRectFill(dirtyRect)
    }
    
    override func drawSelection(in dirtyRect: NSRect) {
        if selectionHighlightStyle != .none{
            selectionBackgroundColor.setFill()
            NSRectFill(dirtyRect)
        }
    }
    
    var seperatorRect: NSRect{
        get{
            var rect = bounds
            rect.origin.y = NSMaxY(rect)-1
            rect.size.height = 1
            return rect
        }
    }
    
    override func drawSeparator(in dirtyRect: NSRect) {
        NSColor.red.set()
        NSRectFill(seperatorRect)
    }
    
    override func drawBackground(in dirtyRect: NSRect) {
        super.drawBackground(in: dirtyRect)
        if isSelected || mouseInside{
            selectionBackgroundColor.setFill()
        }else  {
            normalBackgroundColor.setFill()
        }
        NSRectFill(dirtyRect)
        
    }
    
    override var interiorBackgroundStyle: NSBackgroundStyle{
        return .dark
    }
}


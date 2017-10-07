//
//  Marker.swift
//  ChartsDemo
//
//  Created by Rupam Mitra on 31/07/16.
//  Copyright © 2016 Rupam Mitra. All rights reserved.
//

import UIKit
import Charts

open class Marker: MarkerImage {
    
    open var color: UIColor!;
    open var arrowSize = CGSize(width: 15, height: 11);
    open var font: UIFont!;
    open var insets = UIEdgeInsets();
    @objc open var minimumSize = CGSize();
    
    fileprivate var labelns: NSString!;
    fileprivate var _labelSize: CGSize = CGSize();
    fileprivate var _size: CGSize = CGSize();
    fileprivate var _paragraphStyle: NSMutableParagraphStyle!;
    
    @objc public init(color: UIColor, font: UIFont, insets: UIEdgeInsets)
    {
        super.init();
        
        self.color = color;
        self.font = font;
        self.insets = insets;
        
        _paragraphStyle = NSParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle;
        _paragraphStyle.alignment = .left;
    }
    
//    open override var size: CGSize { return _size; }
    
    open override func draw(context: CGContext, point: CGPoint)
    {
        if (labelns === nil)
        {
            return;
        }
        
        var rect = CGRect(origin: point, size: _size);
        rect.origin.x -= _size.width / 2.0;
        rect.origin.y -= _size.height;
        
        context.saveGState();
        
        context.setFillColor(color.cgColor);
        context.beginPath();
        context.move(to: CGPoint(x: rect.origin.x, y: rect.origin.y));
        context.addLine(to: CGPoint(x: rect.origin.x + rect.size.width, y: rect.origin.y));
        context.addLine(to: CGPoint(x: rect.origin.x + rect.size.width, y: rect.origin.y + rect.size.height - arrowSize.height));
        context.addLine(to: CGPoint(x: rect.origin.x + (rect.size.width + arrowSize.width) / 2.0, y: rect.origin.y + rect.size.height - arrowSize.height));
        context.addLine(to: CGPoint(x: rect.origin.x + rect.size.width / 2.0, y: rect.origin.y + rect.size.height));
        context.addLine(to: CGPoint(x: rect.origin.x + (rect.size.width - arrowSize.width) / 2.0, y: rect.origin.y + rect.size.height - arrowSize.height));
        context.addLine(to: CGPoint(x: rect.origin.x, y: rect.origin.y + rect.size.height - arrowSize.height));
        context.addLine(to: CGPoint(x: rect.origin.x, y: rect.origin.y));
        context.fillPath();
        
        rect.origin.y += self.insets.top;
        rect.size.height -= self.insets.top + self.insets.bottom;
        
        UIGraphicsPushContext(context);
        
        labelns.draw(in: rect, withAttributes: [NSAttributedStringKey.font: self.font, NSAttributedStringKey.paragraphStyle: _paragraphStyle, NSAttributedStringKey.foregroundColor: UIColor.white]);
        
        UIGraphicsPopContext();
        
        context.restoreGState();
    }
    
    open override func refreshContent(entry: ChartDataEntry, highlight: Highlight)
    {
        labelns = entry.data as! NSString;
        
        _labelSize = labelns.size(withAttributes: [NSAttributedStringKey.font: self.font]);
        _size.width = _labelSize.width + self.insets.left + self.insets.right;
        _size.height = _labelSize.height + self.insets.top + self.insets.bottom;
        _size.width = max(minimumSize.width, _size.width);
        _size.height = max(minimumSize.height, _size.height);
    }
}

//
//  Image.swift
//  myFitBitApp
//
//  Created by Luis Castillo on 3/10/16.
//  Copyright © 2016 LC. All rights reserved.
//

import Foundation
import UIKit

class Image
{
    private var _imageUrl:String
    private var _image:UIImage

    var image:UIImage
        {
        return _image
    }
    
    
    convenience init(imageUrl:String)
    {
        self.init()
        
        _imageUrl = imageUrl
        
        //fetching image
        if let imageUrl:NSURL = NSURL(string: imageUrl)
        {
            getDataFromUrl(imageUrl) { (data, response, error) -> Void in
                if error != nil
                {
                    print("error \(error?.localizedDescription)")
                }
                else
                {
                    if let imageData:NSData = data
                    {
                        if let imageDownloaded:UIImage = UIImage(data: imageData)
                        {
                            dispatch_async(dispatch_get_main_queue())
                                { () -> Void in
                                    self._image = imageDownloaded
                            }
                        }//eo-image
                    }//eo-data
                }//
            }//eo-data_fetch
        }//eo-nsurl
    }//eo-c
    
    init(actualImage:UIImage)
    {
        _imageUrl = ""
        _image = actualImage
    }
    
    
    init()
    {
        _image      = UIImage()
        
        //temporary Image
        if let tempImage:UIImage = UIImage(named: "defaultProfileFemale.gif")
        {
            _image = tempImage
        }
        
        _imageUrl   = ""
    }//eo-c
   
}
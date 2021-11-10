//
//  Styling.swift
//  property-listing-ios
//
//  Created by Evan Beh on 10/11/2021.
//

import UIKit

func getstyle2() -> UINavigationBarAppearance
{
   
     let appearance2 = UINavigationBarAppearance()
     appearance2.configureWithTransparentBackground()
     appearance2.backgroundColor = .clear
     appearance2.titleTextAttributes = [.foregroundColor: UIColor.white]
     appearance2.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

    let image = UIImage(systemName: "chevron.left")!

    let imageForNavBarAppearance = image
        .withTintColor(.white)
        .withRenderingMode(.alwaysOriginal)
  
    appearance2.setBackIndicatorImage(imageForNavBarAppearance, transitionMaskImage: imageForNavBarAppearance)


   return appearance2
}

func getstyle1() -> UINavigationBarAppearance
{
   
   let appearance1 = UINavigationBarAppearance()
   appearance1.configureWithTransparentBackground()
   appearance1.backgroundColor = .white
   appearance1.titleTextAttributes = [
       NSAttributedString.Key.foregroundColor: UIColor.black,
       NSAttributedString.Key.font: UIFont(name: "Avenir Next Demi Bold", size: 16)!]
   
   appearance1.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
   
    let image = UIImage(systemName: "chevron.left")!

    let imageForScrollNavBarAppearance = image
        .withTintColor(.black)
        .withRenderingMode(.alwaysOriginal)
    appearance1.setBackIndicatorImage(imageForScrollNavBarAppearance, transitionMaskImage: imageForScrollNavBarAppearance)

   return appearance1
}

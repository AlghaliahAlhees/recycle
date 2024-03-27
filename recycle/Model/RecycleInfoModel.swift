//
//  RecycleInfoModel.swift
//  recycle
//
//  Created by Alghalya Alhees on 27/03/2024.
//

import Foundation
import SwiftUI
struct recycleInfoModel: Identifiable{
    let id = UUID()
    let title, image , description, link: String
    
}


let recycleInfo : [recycleInfoModel] = [
    
    .init(title: "Why Recycle?", image: "re2", description: "When we recycle, recyclable materials are reprocessed into new products, and as a result the amount of rubbish sent to landfill sites decreases which reduces emissions of methane, a powerful greenhouse gas.", link: "https://www.brysonrecycling.org/recycling/why-recycle/"),
    
    .init(title: "Recycling Basics and Benefits", image: "re3", description: "Recycling is the process of collecting and processing materials that would otherwise be thrown away as trash and turning them into new products. Recycling can benefit your community, the economy, and the environment. Products should only be recycled if they cannot be reduced or reused.", link: "https://www.epa.gov/recycle/recycling-basics-and-benefits#:~:text=Recycling%20provides%20many%20benefits%20to,and%20minerals%20for%20new%20products."),

    .init(title: "FIVE BENEFITS OF RECYCLING", image: "re1", description: "How often do you stop and think about the ways recycling can benefit you? Take a second and consider your daily life – have you ever thrown away an aluminum can because it feels like too much work to clean out? Or, do you know what can and cannot go into your recycling cart? Often, people choose not to recycle because it is an extra step that doesn’t reap an instant reward. However, taking small steps to create good recycling habits in your daily life produces benefits that impact you far more than you likely realize." , link: "https://sheboygandpw.com/news-updates/five-benefits-of-recycling-2020-01-14")

]

//
//  CellSliderUIView.swift
//  HW3.2
//
//  Created by Семен on 19.10.2020.
//

import SwiftUI

struct CellSliderUIView: View {
    @Binding var value: Double
    @State private var showAlert = false
    var body: some View {
        HStack {
            Text("\(lround(value))")
            Slider(value: $value, in: 0...255, step: 1)
            TextField("", value: $value, formatter: NumberFormatter(), onCommit: {
                //хранится ли здесь старое значение?? чтобы не обнулять, а оставлять старое значение через onEditingChanged - тоже не получилось
                if value <= 0.0 || value >= 255.0 {
                    //value = value
                    showAlert = true
                    return
                }
            })
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text("Wrong Format!"), message: Text("Enter a number between 0 and 255"))
            })
            //Хотелось бы как-нибудь вычилять правильные размеры, а не подбивать. Есть ли способ?
            .frame(width: 50)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
        }.padding()
    }
    
}



struct CellSliderUIView_Previews: PreviewProvider {
    static var previews: some View {
        CellSliderUIView(value: .constant(0.0))
    }
}

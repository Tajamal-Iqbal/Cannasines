//
//  OnBoardingView.swift
//  Cannassaince
//
//  Created by apple on 29/05/2023.
//



import SwiftUI


struct OnBoardingView: View {
    @State private var currentPage = 0
    
    let padding: CGFloat = 100
    let backgroundOffset: CGFloat = 50
    
    var maxPageIndex: Int {
        Model.titles.count
    }
    
    
    var body: some View {
        ZStack {
            Color(currentPage >= 2 ? .black :. white)
                .ignoresSafeArea()
            GeometryReader { geometry in
                VStack(spacing: 15) {
                    ZStack (alignment: .top){
                        Image(currentPage >= 1 ? AppImages.imgOnBordB : AppImages.imgOnBordA)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: geometry.size.height * 0.6 == 375.0  ?  geometry.size.height * 0.6 : geometry.size.height * 0.5)
                            
                        Image(AppImages.imgLogWhite)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 100)
                            .padding(.top, 20)
                        
                    }
                   Spacer()
                    
                      VStack (spacing: 12) {
                          
                              if currentPage <= 1{
                                  HStack(spacing: 8) {
                                      ForEach(0..<Model.titles.count, id: \.self) { index in
                                          RoundedRectangle(cornerRadius: 2)
                                              .frame(width: 35, height: 6)
                                              .foregroundColor(index == currentPage ? Color(AppColorss.secondary) : .gray)
                                      }
                                  }
                              }
                          VStack (spacing: 8) {
                              Text(Model.titles[currentPage])
                                  .font(.custom("Montserrat-Bold", size: 20))
                                  .foregroundColor(currentPage <= 1 ? Color(AppColorss.secondary) : .white)
                                  .multilineTextAlignment(.center)
                              
                              Text(Model.descriptions[currentPage])
                                  .font(.custom("Roboto-Regular", size: 14))
                                  .foregroundColor(currentPage <= 1 ? Color(AppColorss.secondary) : .white)
                                  .multilineTextAlignment(.center)
                              
                          }
                          .padding()
                          if currentPage > 1{
                              HStack(spacing: 8) {
                                  ForEach(0..<Model.titles.count, id: \.self) { index in
                                      RoundedRectangle(cornerRadius: 2)
                                          .frame(width: 35, height: 6)
                                          .foregroundColor(index == currentPage ? Color(AppColorss.secondary) : .gray)
                                  }
                              }
                          }
                          
                            }
                    VStack {
                        
                        Button(action: {
                            nextPage()
                        }) {
                            Text(AppStrings.next)
                                .font(.custom(" Roboto-Medium.ttf", size: 14))
                           .foregroundColor(Color.white)
                                .padding(.horizontal, 150)
                                .frame(height: 50)
                                .background(Color(AppColorss.secondary))
                                .cornerRadius(20)
                            
                        }
                            .edgesIgnoringSafeArea(.bottom)
                    }
                }
                
            }
        }
        .onAppear {
            
        }
    }
    
    func nextPage() {
        currentPage = (currentPage + 1) % Model.titles.count
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}

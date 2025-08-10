//
//  Configuracoes.swift
//  Nitendots
//
//  Created by iredefbmac_29 on 09/08/25.
//

import SwiftUI

struct Configuracoes: View {
    @ObservedObject var themeManager = ThemeManager.shared
    
    var body: some View {
        ZStack (alignment: .center) {
            themeManager.ActiveTheme.secondary
                .ignoresSafeArea(edges: .all)
            
            ScrollView(.vertical, showsIndicators: true) {
                VStack(spacing: 0) {
                    // Lista
                    List {
                        // Botão de Idioma
                        Button(
                            action: {
                                print("hi")
                            },
                            label: {
                                HStack {
                                    Image(systemName: "translate")
                                        .font(.system(size: 25))
                                    
                                    VStack(alignment: .leading) {
                                        Text("Idioma")
                                            .font(.system(size: 20))
                                        Text("Português (pt-BR)")
                                            .font(.system(size: 15))
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                        )
                        .badge("Pop-Up")
                        .listRowBackground(Color.clear)
                        // Fim do Botão de Idioma
                        
                        // Botão de Tema
                        Button(
                            action: {
                                print("hi")
                            },
                            label: {
                                HStack {
                                    Image(systemName: "circle.righthalf.filled")
                                        .font(.system(size: 35))
                                    
                                    VStack(alignment: .leading) {
                                        Text("Modo do Tema")
                                            .font(.system(size: 20))
                                        Text("Claro (Padrão do Sistema)")
                                            .font(.system(size: 15))
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                        )
                        .badge("Pop-Up")
                        .listRowBackground(Color.clear)
                        // Fim do Botão de Tema
                        
                        // Informativo dos Temas
                        HStack {
                            Image(systemName: "paintbrush.fill")
                                .font(.system(size: 35))
                            
                            VStack(alignment: .leading) {
                                Text("Escolha de Tema")
                                    .font(.system(size: 20))
                                Text("Deslize e selecione!")
                                    .font(.system(size: 15))
                                    .foregroundColor(.gray)
                            }
                        }
                        .listRowBackground(Color.clear)
                        // Fim do Informativo dos Temas
                        
                        
                    }
                    .frame(height: 3*65)
                    .listStyle(PlainListStyle())
                    .foregroundStyle(themeManager.ActiveTheme.text)
                    // Fim da Lista
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 0) {
                            ForEach(themeManager.Themes) { theme in
                                Button(
                                    action: {
                                        themeManager.setTheme(theme)
                                    },
                                    label: {
                                        ThemeSelector(size: 1, theme: theme)
                                            .shadow(
                                                color: theme.isActive ? Color.blue : Color.gray,
                                                    radius: 10)
                                    }
                                )
                            } .padding(.horizontal, 15)
                        } .padding(.vertical, 15)
                    } .frame(width: UIScreen.main.bounds.width)
                    
                    // Divisória
                    RoundedRectangle(cornerRadius: 2)
                        .frame(width: UIScreen.main.bounds.width-30, height: 1)
                        .padding()
                        .foregroundStyle(Color.gray)
                    
                    Image(systemName: "person.3.fill")
                        .font(.system(size: 50, weight: .bold))
                        .padding()
                    
                    Text("Equipe 19 - Capacita Brasil 2025")
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Text("""
                    Mentor 1
                    Mentor 2
                    
                    Aluno 1
                    Aluno 2
                    Aluno 3
                    Aluno 4
                    Aluno 5
                    Aluno 6
                    Aluno 7
                    Aluno 8
                    Aluno 9
                    Aluno 10
                    
                    Agradecemos por usar nosso projeto :)
                    """)
                    .multilineTextAlignment(.center)
                    .padding()
                }
            }
        }
        
        .navigationTitle(Text("Configurações"))
            .toolbarBackground(Color.white, for: .navigationBar)
            .toolbarBackgroundVisibility(.visible)
    }
}

#Preview {
    Configuracoes()
    
    /*
    NavigationStack {
        NavigationLink {
            Configuracoes()
        } label: {
            Text("waow (clique aqui ó)")
        }
    }
    */
}

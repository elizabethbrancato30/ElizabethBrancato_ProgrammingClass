//
//  ImmersiveView.swift
//  FiveShapesApp
//
//  Created by Elizabeth Evelyn Brancato on 10/9/26.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    var body: some View {
        RealityView { content in
            let sphere = ModelEntity(
                mesh: .generateSphere(radius: 0.1),
                materials: [SimpleMaterial(color: .cyan, isMetallic: false)])
            sphere.position = [-0.6, 1.2, -1]
            content.add(sphere)
            sphere.move(
                to: Transform(translation: [-0.6, 1.6, -1]),
                relativeTo: nil, duration: 2.0)

            let box = ModelEntity(
                mesh: .generateBox(size: 0.15),
                materials: [SimpleMaterial(color: .red, isMetallic: false)])
            box.position = [-0.3, 1.2, -1]
            content.add(box)
            box.move(
                to: Transform(translation: [-0.3, 1.6, -1]),
                relativeTo: nil, duration: 2.0)

            let cylinder = ModelEntity(
                mesh: .generateCylinder(height: 0.2, radius: 0.08),
                materials: [SimpleMaterial(color: .yellow, isMetallic: false)])
            cylinder.position = [0, 1.2, -1]
            content.add(cylinder)
            cylinder.move(
                to: Transform(translation: [0, 1.6, -1]),
                relativeTo: nil, duration: 2.0)

            let cone = ModelEntity(
                mesh: .generateCone(height: 0.2, radius: 0.1),
                materials: [SimpleMaterial(color: .green, isMetallic: false)])
            cone.position = [0.3, 1.2, -1]
            content.add(cone)
            cone.move(
                to: Transform(translation: [0.3, 1.6, -1]),
                relativeTo: nil, duration: 2.0)

            let slab = ModelEntity(
                mesh: .generateBox(width: 0.2, height: 0.05, depth: 0.15),
                materials: [SimpleMaterial(color: .purple, isMetallic: false)])
            slab.position = [0.6, 1.2, -1]
            content.add(slab)
            slab.move(
                to: Transform(translation: [0.6, 1.6, -1]),
                relativeTo: nil, duration: 2.0)
        }
    }
}

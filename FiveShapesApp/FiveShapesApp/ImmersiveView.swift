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
    @State private var subscription: EventSubscription?

    var body: some View {
        RealityView { content in
            let sphere = ModelEntity(
                mesh: .generateSphere(radius: 0.1),
                materials: [SimpleMaterial(color: .cyan, isMetallic: false)])
            sphere.position = [-0.6, 1.2, -1]
            content.add(sphere)

            let box = ModelEntity(
                mesh: .generateBox(size: 0.15),
                materials: [SimpleMaterial(color: .red, isMetallic: false)])
            box.position = [-0.3, 1.2, -1]
            content.add(box)

            let cylinder = ModelEntity(
                mesh: .generateCylinder(height: 0.2, radius: 0.08),
                materials: [SimpleMaterial(color: .yellow, isMetallic: false)])
            cylinder.position = [0, 1.2, -1]
            content.add(cylinder)

            let cone = ModelEntity(
                mesh: .generateCone(height: 0.2, radius: 0.1),
                materials: [SimpleMaterial(color: .green, isMetallic: false)])
            cone.position = [0.3, 1.2, -1]
            content.add(cone)

            let plane = ModelEntity(
                mesh: .generatePlane(width: 0.2, height: 0.2),
                materials: [SimpleMaterial(color: .purple, isMetallic: false)])
            plane.position = [0.6, 1.2, -1]
            content.add(plane)

            let shapes = [sphere, box, cylinder, cone, plane]
            let startTime = Date()

            // Runs every frame to keep the shapes moving
            subscription = content.subscribe(to: SceneEvents.Update.self) { _ in
                let t = Float(Date().timeIntervalSince(startTime))

                for (index, shape) in shapes.enumerated() {
                    // Float up and down (each shape slightly out of sync)
                    shape.position.y = 1.2 + 0.1 * sin(t * 2 + Float(index))
                }

                // Spin the first four around the vertical axis
                for shape in [sphere, box, cylinder, cone] {
                    shape.transform.rotation = simd_quatf(angle: t, axis: [0, 1, 0])
                }

                // Spin the plane in place so it always faces you
                plane.transform.rotation = simd_quatf(angle: t, axis: [0, 0, 1])
            }
        }
    }
}

import { Controller } from "@hotwired/stimulus";
import * as THREE from "three";
import { OrbitControls } from "three/examples/jsm/controls/OrbitControls.js";
import { OBJLoader } from "three/examples/jsm/loaders/OBJLoader.js";
import { MTLLoader } from "three/examples/jsm/loaders/MTLLoader.js";

// Connects to data-controller="objects"
export default class extends Controller {
  connect() {
    console.log("Hello, Stimulus!");
    console.log("Obj: ", this.element.dataset.object);
    console.log("Mat: ", this.element.dataset.material);

    // Create a scene
    this.scene = new THREE.Scene();

    // Create a camera
    this.camera = new THREE.PerspectiveCamera(
      75,
      window.innerWidth / window.innerHeight,
      0.1,
      1000
    );
    this.renderer = new THREE.WebGLRenderer({ canvas: this.element });
    this.renderer.setSize(window.innerWidth * 0.5, window.innerHeight * 0.5);

    const directionalLight = new THREE.DirectionalLight(0xffffff, 5);
    directionalLight.position.set(0, 1, 0);
    this.scene.add(directionalLight);

    this.camera.position.x = 3;
    this.camera.position.y = 5;
    this.camera.position.z = 15;

    // Create OrbitControls
    this.controls = new OrbitControls(this.camera, this.renderer.domElement);

    this.createObject();
    this.animate();
  }
  animate() {
    requestAnimationFrame(this.animate.bind(this));

    this.controls.update();

    this.renderer.render(this.scene, this.camera);
  }
  async createObject() {
    const loader = new OBJLoader();
    let hasMTLFile;
    this.material = await this.loadMaterials();
    if (!this.material) {
      hasMTLFile = false;
      console.log("No material file");
      this.material = await this.createMaterialFromAttributes();
    } else {
      hasMTLFile = true;
      console.log("Has material file");
      loader.setMaterials(this.material);
    }

    loader.load(
      this.element.dataset.object,
      (object) => {
        if (hasMTLFile) {
          this.scene.add(object);
          return;
        }
        object.traverse((child) => {
          if (child instanceof THREE.Mesh) {
            console.log(this.material);
            child.material = this.material;
          }
        });

        this.scene.add(object);
      },
      (xhr) => {
        console.log((xhr.loaded / xhr.total) * 100 + "% loaded");
      },
      (error) => {
        console.log("An error happened");
        console.error(error);
      }
    );
  }
  async loadMaterials() {
    if (!this.element.dataset.material) {
      return;
    }
    console.log("Has material");
    const loader = new MTLLoader();

    return new Promise((resolve, reject) => {
      loader.load(
        this.element.dataset.material,
        (materials) => {
          materials.preload();
          resolve(materials);
        },
        undefined,
        reject
      );
    });
  }
  async createMaterialFromAttributes() {
    return new THREE.MeshStandardMaterial({
      // make green
      color: this.element.dataset.color,
      // make it shiny
      roughness: 0,
      // make it shiny
      metalness: 0,
      // emissive
      emissive: this.element.dataset.color,
      // make it double sided
      side: THREE.DoubleSide,
      // shading
      flatShading: this.element.dataset.flatShading,
      // wireframe
      wireframe: false,
    });
  }
}

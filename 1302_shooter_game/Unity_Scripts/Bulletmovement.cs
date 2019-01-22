using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Bulletmovement : MonoBehaviour {

    private float speed = 20;
    public float factor = 1;
	// Use this for initialization

	void Start () {

        GetComponent<Rigidbody>().velocity = transform.forward * speed * factor;

    }
	
	
    
}

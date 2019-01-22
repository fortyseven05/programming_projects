using System.Collections;
using System.Collections.Generic;
using UnityEngine;
//Kyle Duncan
public abstract class WeaponBase : MonoBehaviour
{
    public Rigidbody shell;
    public float projectileSpeed;
    public AudioClip fireClip;
    protected GameObject player; 

    public void Awake()
    { 

    }

        private void Start()
    {
        player = GameObject.Find("Player");
    }

    public void Update()
    {
        if (projectileSpeed <= 8)
            projectileSpeed = 9;

        if (Input.GetButtonDown("Fire") == true)
        {
            fire();
        }
    }

    public abstract void fire();
	
}

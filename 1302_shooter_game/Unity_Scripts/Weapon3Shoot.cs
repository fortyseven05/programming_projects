using System.Collections;
using System.Collections.Generic;
using UnityEngine;
//Kyle Duncan
public class Weapon3Shoot : WeaponBase
{
    public Transform shellSpawnA;
    public Transform shellSpawnB;

    private float fireRate = .4f;
    private float timeToFire = 0.0f;



    public override void fire()
    {
        if (Time.time > timeToFire)
        {
            AudioSource.PlayClipAtPoint(fireClip, player.transform.position, .5f);

            timeToFire = Time.time + fireRate;

            Rigidbody shellInstanceA = Instantiate(shell, shellSpawnA.position, shellSpawnA.rotation) as Rigidbody;
            shellInstanceA.velocity = shellSpawnA.forward * projectileSpeed;

            Rigidbody shellInstanceB = Instantiate(shell, shellSpawnB.position, shellSpawnB.rotation) as Rigidbody;
            shellInstanceB.velocity = shellSpawnB.forward * projectileSpeed;


        }


    }
}
